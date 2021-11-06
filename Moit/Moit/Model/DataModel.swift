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

enum OrderType : String,Identifiable,CaseIterable {
    case together,share
    
    var title : LocalizedStringKey{
        switch self {
        case .together:
            return "모여서 단건배달"
        case .share:
            return "나누어 먹을래요"
        }
    }
    
    var id : Int {
        switch self {
        case .together:
            return 0
        case .share:
            return 1
        }
    }
}

struct Category : Identifiable,Codable{
    var id : Int
    var title : String
}

struct MenuData : Identifiable,Codable{
    var id : String
    var restaurant_id : Int
    var title : String
    var price : Int
    var image_id : Int
    var isSelected : Bool //Decoder 커스텀하기
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
    var categoryName : String
    var menus : [String]
    var fees : [String]
    var name : String
    var openAt : String
    var closeAt : String
}

struct User : Identifiable,Codable{
    var id : Int
    var region_id : Int
    var university_id : Int
    var email : String
    var phoneNumber : String
    var name : String
    var point : Int
    var created_at : String
    var updated_at : String
}

struct Location : Identifiable,Codable{
    var id : Int
    var latitude : Float
    var longitude : Float
}

struct Usage : Identifiable {
    var id : Int
    var date : Date
    var point : Int
    var restraunt : String //나중에 id로 교체할 것
}

struct KeychainData : Codable {
    var accessToken : String
}

struct OrderModel : Codable {
    var restaurantId : Int
    var menus : [[String : Int]]
    var message : String
    var maxParticipants : Int
}

struct UniversityModel : Codable {
    var id : Int
    var name : String
}
