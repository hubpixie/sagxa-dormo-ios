//
//  SDAPIClient.swift
//  SagxaDormo
//
//  Created by x.yang on 2018/11/17.
//  Copyright © 2018年 x.yang. All rights reserved.
//

import Foundation

import Alamofire
import SwaggerClient


class SDApiClient: SwaggerClientAPI {
    enum HttpStatusCode: Int {
        //不正なアクセス
        case invalidAccess = 400
        //データなし
        case notFound = 404
        //権限なし
        case notPermited = 406
        //データ重複
        case duplicatedData = 409
        //未使用チケットあり
        case unusedTickets = 412
        //データ不正
        case dirtyData = 422
        //内部エラー
        case internalError = 500
        //FIRBASEネットワックエラー
        case firebaseNetworkError = 17020
        //その他
        case ohter
    }
    
    struct ErrorInfo {
        var errorCode: Int
        var errorData: Data?
        var innerError: Error?
    }
    
    #if STAGING
    static var webApiPath = "http://192.168.10.103:8080"
    #else
    static var webApiPath = "http://192.168.10.103:8080"
    #endif
    
    // コモーユーザオブジェクト
    static var sagxaDormoUser: User?
    // お知らせ一覧オブジェクト
    //static var currentInquireList: InquireList?

    // FCMトークン取得通知制御フラグ
    private static var _fcmTokenNoticed: Bool = false
    
    //private static var _inquiringTimer: Timer?

    // Verify network connection
    //
    class func verifyConnect(host: String) -> Bool {
        return NetworkReachabilityManager(host: host)?.isReachable ?? false
    }
    
    // set idToken to customeHeaders
    //
    class func prepareHeaders(sender: UIViewController?, idToken: String?, error: Error?) -> Bool {
        var retStat: Bool = false
        //let errCode = NSURLErrorNotConnectedToInternet
        
        //check network connection
        if !verifyConnect(host: webApiPath) {
//            SDMsgViewController.showError(sender: sender, error:(errCode, nil, NSError(domain: "SagxaDormo", code: errCode, userInfo: nil)), extra: nil)
            return false
        }
        if let error = error {
            if error._code == SDApiClient.HttpStatusCode.firebaseNetworkError.rawValue {
//                SDMsgViewController.showError(sender: sender, error:(errCode, nil, NSError(domain: "SagxaDormo", code: errCode, userInfo: nil)), extra: nil)
            } else {
//                SDMsgViewController.showError(sender: sender, error:error, extra: nil)
            }
            return false
        }
        
        //リクエストヘッダをセット
        customHeaders["Accept"] = "application/json"
        customHeaders["Content-Type"] = "application/json"

        if let token = idToken {
            retStat = true
            customHeaders["Authorization"] = "Bearer \(token)"
        }
        
        return retStat
    }

    class func prepareSimpleHeaders() {
        customHeaders.removeAll()
        customHeaders["Accept"] = "application/json"
        customHeaders["Content-Type"] = "application/json; charset=utf-8"
    }
    
    class func getHeadErrorDesc() -> String? {
        if customHeaders.keys.contains("Error") {
            return customHeaders["Error"]
        }else{
            return nil
        }
    }
    
    class func errorInfo(error: Error?) ->ErrorInfo? {
        if error != nil && error is ErrorResponse? {
            let error = error as? ErrorResponse
            if case let ErrorResponse.error(info) = error! {
                return ErrorInfo(errorCode: info.0, errorData: info.1, innerError: info.2)
            }
        }
        return nil
    }
    
    // setup setting
    //
    class func setup() {
    }
    
    // unsetup setting
    //
    class func unsetup() {
        //通知オブザーバーを解除
        if _fcmTokenNoticed {
            NotificationCenter.default.removeObserver(self, name: Notification.Name("FCMToken"), object: nil)
            _fcmTokenNoticed = false
        }
        
        // タイマー停止
        //_inquiringTimer?.invalidate()
    }
    
    // FCMトークン受け取り通知処理
    //
    @objc class func messagingDidReceiveFCMToken(notification: NSNotification) {
    }
    

    
    class func decodeMyModel<T>(_ type: T.Type, from jsonString: String?, keyString: String?) -> (decodableObj: T?, error: Error?) where T : Decodable {
        var returnedDecodable: T? = nil
        var returnedError: Error? = nil
        let decoder: JSONDecoder = JSONDecoder()
        do {
            if let data: Data = jsonString?.data(using: .utf8) {
                if let key = keyString {
                    if let dic:[String: Any] = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                        let item = dic[key] {
                        let buf: Data = try JSONSerialization.data(withJSONObject: item, options: [])
                        returnedDecodable = try decoder.decode(type, from: buf)
                    }
                } else {
                    returnedDecodable = try decoder.decode(type, from: data)
                }
            }
        } catch {
            returnedError = error
        }
        
        return (returnedDecodable, returnedError)
    }
}

