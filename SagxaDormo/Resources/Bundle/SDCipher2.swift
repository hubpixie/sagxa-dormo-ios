//
//  SDCipher2.swift
//  SagxaDormo
//
//  Created by venus.janne on 2019/03/16.
//  Copyright © 2019 com.venuso-janne. All rights reserved.
//

import Foundation
import CommonCrypto

private protocol AESGenerator {
    static func generateIv() -> Data
    static func generateSalt() -> Data
}

private protocol AESCrypter {
    func encrypt(_ digest: Data) throws -> Data
    func decrypt(_ encrypted: Data) throws -> Data
}
class SDCipher2 {
    static  let shared: SDCipher2 = SDCipher2()

    struct AES {
        
        private var key: Data
        private var iv: Data
        
        public init(key: Data, iv: Data) throws {
            guard key.count == kCCKeySizeAES256 else {
                throw Error.badKeyLength
            }
            guard iv.count == kCCBlockSizeAES128 else {
                throw Error.badInputVectorLength
            }
            self.key = key
            self.iv = iv
        }
        
        enum Error: Swift.Error {
            case keyGeneration(status: Int)
            case cryptoFailed(status: CCCryptorStatus)
            case badKeyLength
            case badInputVectorLength
        }
        
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
        
        static func createKey(password: Data, salt: Data) throws -> Data {
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
                throw Error.keyGeneration(status: Int(status))
            }
            return Data(bytes: UnsafePointer<UInt8>(derivedBytes), count: length)
        }
        
    }
    
    func toHexString(data: Data) -> String {
        return data.reduce("") {$0 + String(format: "%02x", $1)}
    }
}
extension SDCipher2.AES: AESCrypter {
    
    func encrypt(_ digest: Data) throws -> Data {
        return try crypt(input: digest, operation: CCOperation(kCCEncrypt))
    }
    
    func decrypt(_ encrypted: Data) throws -> Data {
        return try crypt(input: encrypted, operation: CCOperation(kCCDecrypt))
    }
    
}

extension SDCipher2.AES: AESGenerator {
    static func generateIv() -> Data {
        return generateData(length: kCCBlockSizeAES128)
    }
    
    static func generateSalt() -> Data {
        return generateData(length: 8)
    }
    
    static private func generateData(length: Int) -> Data {
        var data = Data(count: length)
        let status = data.withUnsafeMutableBytes { mutableBytes in
            SecRandomCopyBytes(kSecRandomDefault, length, mutableBytes)
        }
        assert(status == Int32(0))
        return data
    }
    
}

class TestCipher2 {
    func testAES() {
        do {
            let sourceData = "AES256".data(using: .utf8)!
            let password = "password"
            let salt: Data = SDCipher2.AES.generateSalt()
            let iv: Data = SDCipher2.AES.generateIv()
            let key = try SDCipher2.AES.createKey(password: password.data(using: .utf8)!, salt: salt)
            let aes = try SDCipher2.AES(key: key, iv: iv)
            let encryptedData: Data = try aes.encrypt(sourceData)
            let decryptedData: Data = try aes.decrypt(encryptedData)
            
            print("Encrypted hex string: \(encryptedData.base64EncodedString())")
            print("Decrypted hex string: \(String(data: decryptedData, encoding: .utf8)!)")
        } catch {
            print("Failed")
            print(error)
        }
        
    }
}
