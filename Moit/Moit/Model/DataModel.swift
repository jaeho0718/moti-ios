//
//  DataModel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//
import Foundation
import SwiftUI

enum CategoryType : String,Identifiable,CaseIterable,Codable{
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

struct MenuData : Identifiable,Codable{
    
    init(from decoder: Decoder) throws {
        let key = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try key.decode(Int.self, forKey: .id)
        self.name = try key.decode(String.self, forKey: .name)
        self.price = try key.decode(Int.self, forKey: .price)
        self.imageKey = try key.decode(String.self, forKey: .imageKey)
        self.isSelected = false
    }
    
    init(id : Int, name : String, price : Int, imageKey : String) {
        self.id = id
        self.name = name
        self.price = price
        self.imageKey = imageKey
        self.isSelected = false
    }
    
    var id : Int
    var name : String
    var price : Int
    var imageKey : String
    var isSelected : Bool
    
    enum CodingKeys : CodingKey {
        case id,name,price,imageKey
    }
}


struct Post : Identifiable,Codable{
    var id : Int 
    var restaurantId : Int
    var thumbnailImageKey : String
    var creatorId : Int
    var message : String
    var maxParticipants : Int
    var nowParticipants : Int
    var totalPrice : Int
    var createdAt : String
    var updatedAt : String
}

struct Participants : Identifiable,Codable{
    var id : Int
    var post_id : Int
    var user_id : Int
}

struct Restaurant : Identifiable,Codable{
    var id : Int
    var categoryId : Int
    var categoryName : String
    var menus : [MenuData]
    var fees : [Fee]
    var name : String
    var account : String
    var imageKey : String
    var openAt : String
    var closeAt : String
    
    var createdAt : String
    var updatedAt : String
    
    struct Fee : Codable {
        var id : Int
        var priceStart : Int
        var priceEnd : Int
        var deliveryFee : Int
    }
}

struct User : Identifiable,Codable{
    var id : Int
    var universityName : String
    var regionName : String
    var email : String
    var phoneNumber : String
    var name : String
    var point : Int
    var createdAt : String
    var updatedAt : String
    var manner : Double?
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

///주문전송용 구조체
struct OrderModel : Codable {
    var restaurantId : Int
    var menus : [MenuProperty]
    var message : String
    var maxParticipants : Int
    
    struct MenuProperty : Codable {
        var menuId : Int
        var count : Int
    }
}

struct UniversityModel : Codable,Identifiable{
    var id : Int
    var name : String
}

struct Category : Codable,Identifiable{
    var name : CategoryType
    var id : Int
}

struct SignUpData : Codable {
    var email : String
    var name : String
    var phoneNumber : String
    var password : String
    var universityId : Int
}
