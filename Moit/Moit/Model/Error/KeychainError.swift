//
//  KeychainError.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import Foundation

enum KeychainError : Error,LocalizedError {
    case saveError,noData
    
    var errorDescription: String? {
        switch self {
        case .saveError:
            return "키체인에 저장할 수 없습니다."
        case .noData:
            return "키체인에 저장된 데이터가 없습니다."
        }
    }
}
