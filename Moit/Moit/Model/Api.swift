//
//  Api.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/08.
//

import Foundation

enum Api {
    case login
    case signIn
    case user
    case restaurant
    case order
    case join(Int)
    case category
    case university
    
    var origin : String {
        "http://moit-server-prod.eba-eecfjwgm.ap-northeast-2.elasticbeanstalk.com/api/v1"
    }
    
    var request : String {
        switch self {
        case .login :
            return origin + "/auth/login"
        case .signIn :
            return origin + "/user"
        case .user :
            return origin + "/user/me"
        case .restaurant :
            return origin + "/restaurant"
        case .order :
            return origin + "/order"
        case .join(let id) :
            return origin + "/order/\(id)/join"
        case .category :
            return origin + "/category"
        case .university :
            return origin + "/university"
        }
    }
}
