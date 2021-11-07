//
//  NotiView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct NotiView: View {
    @StateObject var notification = NotificationViewModel()
    
    var body: some View {
        VStack(spacing:0){
            HStack{
                Text("알림내역").font(.custom("DoHyeon-Regular", size: 28))
                    .foregroundColor(.black)
                Spacer()
            }.padding(.horizontal,15).padding(.vertical,4)
            ScrollView(.vertical,showsIndicators: false){
                if notification.notifications.isEmpty {
                    Text("알림이 없어요.").font(.custom("DoHyeon-Regular", size: 15))
                        .padding()
                } else {
                    LazyVStack{
                        ForEach(notification.notifications){ noti in
                            NotiCellView(notification: noti)
                            Divider()
                        }
                    }.padding(.horizontal,15)
                }
            }
        }
        .background(Color.white.ignoresSafeArea())
        .navigationTitle("").navigationBarHidden(true)
        .onAppear{
            notification.getNotificationList()
        }
    }
}

struct NotiView_Previews: PreviewProvider {
    static var previews: some View {
        NotiView()
    }
}
