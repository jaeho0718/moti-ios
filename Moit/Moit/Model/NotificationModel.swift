//
//  NotificationModel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import Foundation

struct NotificationModel : Identifiable {
    var id : Int
    var date : Date
    var title : String
    var body : String
    var image : String
}
