//
//  NotiCellView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct NotiCellView: View {
    
    var notification : NotificationModel
    
    var body: some View {
        HStack(spacing:0){
            Image("testImage").resizable().aspectRatio(contentMode: .fill)
                .frame(width: 48, height: 48).clipShape(Circle())
            VStack(alignment:.leading, spacing: 0){
                HStack{
                    Text(notification.title).font(.custom("DoHyeon-Regular", size: 16))
                        .foregroundColor(.black)
                    Spacer(minLength: 0)
                    Text(notification.date.noti_date).font(.custom("DoHyeon-Regular", size: 12))
                        .foregroundColor(Color("SecondaryTextColor"))
                        .padding(.top,2).padding(.trailing,5)
                }
                
                Text(notification.body).font(.custom("DoHyeon-Regular", size: 14))
                    .foregroundColor(Color("SecondaryTextColor")).padding(.top,2)
            }.padding(.leading,15)
        }.frame(minHeight:60)
    }
}

struct NotiCellView_Previews: PreviewProvider {
    static var previews: some View {
        NotiCellView(notification: .init(id: 0, date: Date(), title: "음식 조리중"
                                    , body: "30~40분 후 배달이 시작됩니다."
                                    , image: "https://akamai.pizzahut.co.kr/2020pizzahut-prod/public/img/menu/RPPZ1517_RPEG0015_l.png"))
    }
}
