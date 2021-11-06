//
//  ResponseModel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import Foundation

struct LoginResponse : Codable {
    var accessToken : String
}

enum DataLoadType {
    case cache,api
}
