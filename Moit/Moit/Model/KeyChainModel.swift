//
//  KeyChainModel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import Foundation
import Security

//본래 키체인에 Apikey를 저장하려했지만 시간이 부족해 하지 못함.
final class KeyChainModel {
    private let service = "MotiKey_ABCD"
    
    static let shared = KeyChainModel()
    
    /// Certification에 대한 정보를 저장합니다.
    func createValue(data : LoginResponse,completion : @escaping (Result<Bool,Error>) -> Void) {
        do {
            let data = try JSONEncoder().encode(data)
            guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                completion(.failure(DataError.notValidateUrl))
                return
            }
            let fileURL = path.appendingPathComponent("key.json")
            try data.write(to: fileURL)
            completion(.success(true))
            /*
             let query : [CFString:Any] = [kSecClass:kSecClassGenericPassword
                                           ,kSecAttrService : service
                                           ,kSecAttrAccount: "TokenKey"
                                           ,kSecAttrGeneric : data]
             if SecItemAdd(query as CFDictionary, nil) == errSecSuccess {
                 completion(.success(true))
             }else {
                 completion(.failure(KeychainError.saveError))
             }
             */
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func readValue(completion : @escaping (Result<LoginResponse,Error>) -> Void ) {
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            completion(.failure(DataError.notValidateUrl))
            return
        }
        do{
            let fileURL = path.appendingPathComponent("key.json")
            let data = try Data(contentsOf: fileURL,options: .mappedIfSafe)
            let result = try JSONDecoder().decode(LoginResponse.self, from: data)
            completion(.success(result))
        } catch let error {
            completion(.failure(error))
        }
        
       /*
        let query : [CFString:Any] = [kSecClass:kSecClassGenericPassword
                                      ,kSecAttrService : service
                                      ,kSecAttrAccount: "TokenKey"
                                      ,kSecMatchLimit : kSecMatchLimitOne
                                      ,kSecReturnAttributes : true
                                      ,kSecReturnData : true]
        var item : CFTypeRef?
        
        if SecItemCopyMatching(query as CFDictionary, &item) == errSecSuccess {
            if let existingItem = item as? [CFString : Any], let data = existingItem[kSecAttrGeneric] as? Data {
                do {
                    let rawdata = try JSONDecoder().decode(LoginResponse.self, from: data)
                    completion(.success(rawdata))
                } catch let error {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(KeychainError.noData))
            }
        } else {
            completion(.failure(KeychainError.noData))
        }*/
    }
    
    func updateValue(data : LoginResponse,completion : @escaping (Result<Bool,Error>) -> Void ) {
        do {
            let encoded_data = try JSONEncoder().encode(data)
            let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                            kSecAttrService: service,
                                            kSecAttrAccount: "TokenKey"]
            let attributes: [CFString: Any] = [kSecAttrAccount: "TokenKey",
                                                 kSecAttrGeneric: encoded_data]
            if SecItemUpdate(query as CFDictionary, attributes as CFDictionary) == errSecSuccess {
                completion(.success(true))
            } else {
                completion(.failure(KeychainError.saveError))
            }
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func delete(completion : @escaping (Result<Bool,Error>) -> Void) {
        let query : [CFString:Any] = [kSecClass:kSecClassGenericPassword
                                      ,kSecAttrService : service]
        if SecItemDelete(query as CFDictionary) == errSecSuccess {
            completion(.success(true))
        } else {
            completion(.failure(KeychainError.noData))
        }
    }
}
