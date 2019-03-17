//
//  SDCipher4.swift
//  SagxaDormo
//
//  Created by venus.janne on 2019/03/16.
//  Copyright © 2019 com.venuso-janne. All rights reserved.
//

import Foundation
import CommonCrypto

class SDCipher4 {
    enum CryptoError: Error {
        case modeError
        case encryptError
        case decryptError
        case otherError
    }
    enum BlockMode: CCMode {
        case ecb = 1, cbc, cfb, ctr, f8, lrw, ofb, xts, rc4, cfb8
        var needIV: Bool {
            switch self {
            case .cbc, .cfb, .ctr, .ofb, .cfb8: return true
            default: return false
            }
        }
    }
    static  let shared: SDCipher4 = SDCipher4()

    var cryptoMode: CCOperation!
    var algorithm: CCAlgorithm! = CCAlgorithm(kCCAlgorithmAES)
    var ccMode: BlockMode! = .ctr
    var ivData: Data! = Data(count: kCCBlockSizeAES128)
    var comKeyString: String! = "keyData890123456"

    func encrypt(rawString: String)throws -> String? {
        self.cryptoMode = CCOperation(kCCEncrypt)
        return try self.cryptString(rawString: rawString.data(using: .utf8)!.base64EncodedString())
    }
    func decrypt(rawString: String)throws -> String? {
        self.cryptoMode = CCOperation(kCCDecrypt)
        return try self.cryptString(rawString: rawString)
    }

    private func cryptString(rawString: String) throws -> String? {
        //Key to Data
        let key: Data = self.comKeyString.data(using: .utf8)!
        
        //String to encrypt to Data
        let data: Data = Data(base64Encoded: rawString)!
        
        // Init cryptor
        var cryptor: CCCryptorRef? = nil
        
        // Alloc Data Out
        var cipherData = Data(count: (data.count) + kCCBlockSizeAES128)
        
        //Empty IV: initialization vector
        let iv: Data = self.ivData
        
        //Create Cryptor
       let crRes: CCCryptorStatus = withUnsafePointers(iv, key, { ivBytes, keyBytes in
            return CCCryptorCreateWithMode(
                self.cryptoMode, self.ccMode.rawValue,
                self.algorithm, CCPadding(ccPKCS7Padding),
                ivBytes, keyBytes, key.count,
                nil, 0, 0,
                self.ccMode == .ctr ? CCModeOptions(kCCModeOptionCTR_BE) : CCModeOptions(),
                &cryptor)
        })
        guard crRes == kCCSuccess else {throw CryptoError.modeError}
        
        defer { _ = CCCryptorRelease(cryptor!) }
        
        
        //Update Cryptor
        let needed = CCCryptorGetOutputLength(cryptor!, data.count, true)
        var result:Data = Data(count: needed)
        let rescount = result.count
        var updateLen: Int = 0

        let updRes: CCCryptorStatus = withUnsafePointers(data, &result, { dataBytes, resultBytes in
            return CCCryptorUpdate(
                cryptor!,
                dataBytes, data.count,
                resultBytes, rescount,
                &updateLen)
        })

        guard updRes == kCCSuccess else {throw CryptoError.encryptError}

        //finalize Cryptor
        var finalLen: Int = 0
        let finRes = result.withUnsafeMutableBytes { resultBytes in
            return CCCryptorFinal(
                cryptor!,
                resultBytes + updateLen,
                rescount - updateLen,
                &finalLen)
        }
        guard finRes == kCCSuccess else {throw CryptoError.otherError}
        result.count = updateLen + finalLen
        
        return self.cryptoMode == CCOperation(kCCEncrypt) ? result.base64EncodedString() : String(data: result, encoding: .utf8)
    }

    private func withUnsafePointers<A0, A1, Result>(
        _ arg0: Data,
        _ arg1: Data,
        _ body: (
        UnsafePointer<A0>, UnsafePointer<A1>) throws -> Result
        ) rethrows -> Result {
        return try arg0.withUnsafeBytes { p0 in
            return try arg1.withUnsafeBytes { p1 in
                return try body(p0, p1)
            }
        }
    }
    
    private func withUnsafePointers<A0, A1, Result>(
        _ arg0: Data,
        _ arg1: inout Data,
        _ body: (
        UnsafePointer<A0>,
        UnsafeMutablePointer<A1>) throws -> Result
        ) rethrows -> Result {
        return try arg0.withUnsafeBytes { p0 in
            return try arg1.withUnsafeMutableBytes { p1 in
                return try body(p0, p1)
            }
        }
    }
}

class TestCipher4 {
    func testAES() {
        var cryptData :String?
        do {
            cryptData = try SDCipher4.shared.encrypt(rawString: "rawData890123456")
            print("cryptData:   \(cryptData!)")
        }
        catch (let status) {
            print("Error aesCBCEncrypt: \(status)")
        }
        
        do {
            let decryptData: String? = try SDCipher4.shared.decrypt(rawString: cryptData!)
            print("decryptData-0: \(decryptData!)")
        }
        catch (let status) {
            print("Error aesCBCDecrypt: \(status)")
        }
    }
}
