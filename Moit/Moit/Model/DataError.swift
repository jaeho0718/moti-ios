//
//  DataError.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import Foundation

enum DataError : Error, LocalizedError {
    case notValidateUrl,loginError,noData
    
}

extension DataError {
    var errorDescription: String? {
        switch self {
        case .notValidateUrl:
            return "올바르지 않은 URL 입니다."
        case .loginError :
            return "Login 401 Error"
        case .noData :
            return "데이터가 없습니다."
        }
    }
}
