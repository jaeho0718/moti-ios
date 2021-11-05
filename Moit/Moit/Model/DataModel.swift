//
//  DataModel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//
import Foundation

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
