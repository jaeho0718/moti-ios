//
//  DateModel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import Foundation

extension Date {
    var noti_date : String {
        let dateformmater = DateFormatter()
        dateformmater.dateFormat = "YYYY.MM.dd HH시mm분"
        return dateformmater.string(from: self)
    }
}
