//
//  SDCipher.swift
//  SagxaDormo
//
//  Created by venus.janne on 2019/03/16.
//  Copyright © 2019 com.venuso-janne. All rights reserved.
//

import Foundation
import CommonCrypto

class SDCipher {
    
    enum AESError : Error {
        case encryptFailed(String, Any)
        case decryptFailed(String, Any)
        case keyFailed(String, Any)
        case otherFailed(String, Any)
    }
    static  let shared: SDCipher = SDCipher()

    public struct AES {
        
        /// 暗号
        func encrypt(plainString: String, sharedKey: Data, iv: String) throws -> Data {
            guard let initialzeVector = (iv.data(using: .utf8)) else {
                throw SDCipher.AESError.otherFailed("Encrypt iv failed", iv)
            }
            let keyData = sharedKey
//            guard let keyData = sharedKey.data(using: .utf8) else {
//                throw SDCipher.AESError.otherFailed("Encrypt sharedkey failed", sharedKey)
//            }
            guard let data = plainString.data(using: .utf8) else {
                throw SDCipher.AESError.otherFailed("Encrypt plainString failed", plainString)
            }
            
            // 暗号化後のデータのサイズを計算
//            let cryptLength = size_t(Int(ceil(Double(data.count / kCCBlockSizeAES128)) + 1.0) * kCCBlockSizeAES128)
            var outBytes = [UInt8](repeating: 0, count: data.count + kCCBlockSizeAES128)

            var numBytesEncrypted: Int = 0
            
            // 暗号化
            var cryptStatus: CCCryptorStatus = CCCryptorStatus(kCCSuccess)
            data.withUnsafeBytes {(cryptBytes: UnsafePointer<UInt8>!) -> () in
                initialzeVector.withUnsafeBytes {(ivBytes: UnsafePointer<UInt8>!) in
                    keyData.withUnsafeBytes {(keyBytes: UnsafePointer<UInt8>!) -> () in
                        cryptStatus = CCCrypt(CCOperation(kCCEncrypt),
                                CCAlgorithm(kCCAlgorithmAES),
                                CCOptions(kCCOptionPKCS7Padding | kCCModeCTR),
                                keyBytes,
                                keyData.count,
                                ivBytes,
                                cryptBytes,
                                data.count,
                                &outBytes,
                                outBytes.count,
                                &numBytesEncrypted)
                    }
                }
            }
            

            guard cryptStatus == kCCSuccess else {
                throw SDCipher.AESError.encryptFailed("Encrypt Failed", kCCSuccess)
            }
            return Data(bytes: UnsafePointer<UInt8>(outBytes), count: numBytesEncrypted)
        }
/*
         private func crypt(input: Data, operation: CCOperation) throws -> Data {
             var outLength = Int(0)
             var outBytes = [UInt8](repeating: 0, count: input.count + kCCBlockSizeAES128)
             var status: CCCryptorStatus = CCCryptorStatus(kCCSuccess)
             input.withUnsafeBytes { (encryptedBytes: UnsafePointer<UInt8>!) -> () in
                 iv.withUnsafeBytes { (ivBytes: UnsafePointer<UInt8>!) in
                     key.withUnsafeBytes { (keyBytes: UnsafePointer<UInt8>!) -> () in
                         status = CCCrypt(operation,
                             CCAlgorithm(kCCAlgorithmAES),            // algorithm
                             CCOptions(kCCOptionPKCS7Padding),           // options
                             keyBytes,                                   // key
                             key.count,                                  // keylength
                             ivBytes,                                    // iv
                             encryptedBytes,                             // dataIn
                             input.count,                                // dataInLength
                             &outBytes,                                  // dataOut
                             outBytes.count,                             // dataOutAvailable
                             &outLength)                                 // dataOutMoved
         
                     }
                 }
             }
             guard status == kCCSuccess else {
             throw Error.cryptoFailed(status: status)
             }
             return Data(bytes: UnsafePointer<UInt8>(outBytes), count: outLength)
         }

 */
        
        /// 復号
        func decrypt(encryptedData: Data, sharedKey: Data, iv: String) throws -> String {
            guard let initialzeVector = (iv.data(using: .utf8)) else {
                throw SDCipher.AESError.otherFailed("Encrypt iv failed", iv)
            }
            let keyData = sharedKey
//            guard let keyData = sharedKey.data(using: .utf8) else {
//                throw SDCipher.AESError.otherFailed("Encrypt sharedKey failed", sharedKey)
//            }
            
            let clearLength = size_t(encryptedData.count + kCCBlockSizeAES128)
            var clearData   = Data(count:clearLength)
            
            var numBytesEncrypted :size_t = 0
            
            // 復号
            let cryptStatus: CCCryptorStatus = clearData.withUnsafeMutableBytes {clearBytes in
                initialzeVector.withUnsafeBytes {ivBytes in
                    encryptedData.withUnsafeBytes {dataBytes in
                        keyData.withUnsafeBytes {keyBytes in
                            CCCrypt(CCOperation(kCCDecrypt),
                                    CCAlgorithm(kCCAlgorithmAES),
                                    CCOptions(kCCOptionPKCS7Padding | kCCModeCBC),
                                    keyBytes, keyData.count,
                                    ivBytes,
                                    dataBytes, encryptedData.count,
                                    clearBytes, clearLength,
                                    &numBytesEncrypted)
                        }
                    }
                }
            }
            
            if cryptStatus != kCCSuccess {
                throw SDCipher.AESError.decryptFailed("Decrypt Failed", kCCSuccess)
            }
            
            // パディングされていた文字数分のデータを捨てて文字列変換を行う
            guard let decryptedStr = String(data: clearData.prefix(numBytesEncrypted), encoding: .utf8) else {
                throw SDCipher.AESError.decryptFailed("PKSC Unpad Failed", clearData)
            }
            return decryptedStr
        }
        
        /// ランダムIV生成
        func generateRandamIV() throws -> String {
            
            let ivStr = SDCipher.shared.toHexString(data: self.randomData(length: kCCBlockSizeAES128))
            return ivStr
        }
        func generateRandamSalt() throws -> Data {
            
            return self.randomData(length: kCCBlockSizeAES128)
        }

        func randomData(length: Int) -> Data {
            var data = Data(count: length)
            let status = data.withUnsafeMutableBytes { mutableBytes in
                SecRandomCopyBytes(kSecRandomDefault, length, mutableBytes)
            }
            assert(status == Int32(0))
            return data
        }
        
    }
    
    func createKey(password: Data, salt: Data) throws -> Data {
        let length = kCCKeySizeAES256
        var status = Int32(0)
        var derivedBytes = [UInt8](repeating: 0, count: length)
        password.withUnsafeBytes { (passwordBytes: UnsafePointer<Int8>!) in
            salt.withUnsafeBytes { (saltBytes: UnsafePointer<UInt8>!) in
                status = CCKeyDerivationPBKDF(CCPBKDFAlgorithm(kCCPBKDF2),                  // algorithm
                    passwordBytes,                                // password
                    password.count,                               // passwordLen
                    saltBytes,                                    // salt
                    salt.count,                                   // saltLen
                    CCPseudoRandomAlgorithm(kCCPRFHmacAlgSHA1),   // prf
                    10000,                                        // rounds
                    &derivedBytes,                                // derivedKey
                    length)                                       // derivedKeyLen
            }
        }
        guard status == 0 else {
            throw SDCipher.AESError.otherFailed("key failed", password)
        }
        return Data(bytes: UnsafePointer<UInt8>(derivedBytes), count: length)
    }

    func toHexString(data: Data) -> String {
        return data.reduce("") {$0 + String(format: "%02x", $1)}
    }
}

class TestCipher {
    func testAES() {
        let aes: SDCipher.AES = SDCipher.AES()
        var ivStr: String!
        var encryptedData: Data!
        var key: Data!
        // 暗号
        do {
            key = try SDCipher.shared.createKey(password: "let decryptedString = try aes.decrypt(encryptedData: encryptedData, sharedKey: key, iv: ivStr)".data(using: .utf8)!, salt: aes.generateRandamSalt())
            print("key = \(key.base64EncodedString())")
            ivStr = try aes.generateRandamIV()
            
            encryptedData = try aes.encrypt(plainString: "平文", sharedKey: key, iv: ivStr)
        }
        catch SDCipher.AESError.encryptFailed(_, _) {
            // エラーハンドリング
            return
        }
        catch SDCipher.AESError.otherFailed(_, _) {
            // エラーハンドリング
            return
        }
        catch {
            // その他エラーハンドリング
            return
        }
        
        // 復号
        do {
            let decryptedString = try aes.decrypt(encryptedData: encryptedData, sharedKey: key, iv: ivStr)
            print("encryptedData = \(SDCipher.shared.toHexString(data: encryptedData))")
            print("decryptedString = \(decryptedString)")
        }
        catch SDCipher.AESError.decryptFailed(_, _) {
            // エラーハンドリング
            return
        }
        catch SDCipher.AESError.otherFailed(_, _) {
            // エラーハンドリング
            return
        }
        catch {
            // その他エラーハンドリング
            return
        }
    }
}
