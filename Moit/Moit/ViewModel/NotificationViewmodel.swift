//
//  NotificationViewmodel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import Foundation
import UserNotifications

class NotificationViewModel : ObservableObject {
    
    @Published var notifications : [NotificationModel] = [
        .init(id: 0, date: Date(), title: "음식 조리 중", body: "30~40분 후 배달이 시작됩니다.", image: "")
        ,.init(id: 1, date: Date(), title: "음식 조리 중", body: "30~40분 후 배달이 시작됩니다.", image: "")
        ,.init(id: 2, date: Date(), title: "음식 조리 중", body: "30~40분 후 배달이 시작됩니다.", image: "")
        ,.init(id: 3, date: Date(), title: "음식 조리 중", body: "30~40분 후 배달이 시작됩니다.", image: "")
        ,.init(id: 4, date: Date(), title: "음식 조리 중", body: "30~40분 후 배달이 시작됩니다.", image: "")
        ,.init(id: 5, date: Date(), title: "음식 조리 중", body: "30~40분 후 배달이 시작됩니다.", image: "")
        ,.init(id: 6, date: Date(), title: "음식 조리 중", body: "30~40분 후 배달이 시작됩니다.", image: "")
        ,.init(id: 7, date: Date(), title: "음식 조리 중", body: "30~40분 후 배달이 시작됩니다.", image: "")
        ,.init(id: 8, date: Date(), title: "음식 조리 중", body: "30~40분 후 배달이 시작됩니다.", image: "")
        ,.init(id: 9, date: Date(), title: "음식 조리 중", body: "30~40분 후 배달이 시작됩니다.", image: "")
    ]
    
    func getNotificationList(){
        UNUserNotificationCenter.current().getDeliveredNotifications(completionHandler: {
            noties in
            self.notifications = noties.enumerated().map({
                (index,data) -> NotificationModel in
                return .init(id: index, date: data.date, title: data.request.content.title
                             ,body: data.request.content.body
                            ,image: "https://akamai.pizzahut.co.kr/2020pizzahut-prod/public/img/menu/RPPZ1517_RPEG0015_l.png")
                //이미지 수정하기
            })
        })
    }
}
