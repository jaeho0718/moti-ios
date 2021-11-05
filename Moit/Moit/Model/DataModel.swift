//
//  DataModel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//
import Foundation
import SwiftUI

enum CategoryType : String,Identifiable,CaseIterable {
    case pizza,caffe,korean,hamburger,chinese,western,chicken
    
    var id : Int {
        switch self {
        case .pizza:
            return 0
        case .caffe:
            return 1
        case .korean:
            return 2
        case .hamburger:
            return 3
        case .chinese:
            return 4
        case .western:
            return 5
        case .chicken:
            return 6
        }
    }
    
    var rawValue: String {
        switch self {
        case .pizza:
            return "pizza"
        case .caffe:
            return "caffe"
        case .korean:
            return "korean"
        case .hamburger:
            return "hamburger"
        case .chinese:
            return "chinese"
        case .western:
            return "western"
        case .chicken:
            return "chicken"
        }
    }
    
    var title : LocalizedStringKey{
        switch self {
        case .pizza:
            return "피자"
        case .caffe:
            return "카페/디저트"
        case .korean:
            return "한식"
        case .hamburger:
            return "햄버거"
        case .chinese:
            return "중식"
        case .western:
            return "양식"
        case .chicken:
            return "치킨"
        }
    }
    
    var icon : String {
        switch self {
        case .pizza:
            return "🍕"
        case .caffe:
            return "🍰"
        case .korean:
            return "🍚"
        case .hamburger:
            return "🍔"
        case .chinese:
            return "🍜"
        case .western:
            return "🍝"
        case .chicken:
            return "🍗"
        }
    }
}

struct Category : Identifiable,Codable{
    var id : Int
    var title : String
}

struct Menu : Identifiable,Codable{
    var id : Int
    var restaurant_id : Int
    var title : String
    var price : Int
    var image_id : Int
}

struct Post : Identifiable,Codable{
    var id : Int
    var writer_id : Int
    var title : String
    var content : String
    var location_id : Int
    var max_participants : Int
    var price : Int
    var delivery_fee : Int
    //var created_at
    //var updated_at
}

struct Participants : Identifiable,Codable{
    var id : Int
    var post_id : Int
    var user_id : Int
}

struct Restaurant : Identifiable,Codable{
    var id : Int
    var category_id : Int
    var open_at : Int
    var close_at : Int
    var location_id : Int
    var delivery_fee : Int
    var account : String
    //var created_at :
    //var updated_at
}

struct User : Identifiable,Codable{
    var id : Int
    var email : String
    var phone : String
    var name : String
    var location_id : Int
    //var created_at :
    //var updated_at
    var point : Int
}

struct Location : Identifiable,Codable{
    var id : Int
    var latitude : Float
    var longitude : Float
}
