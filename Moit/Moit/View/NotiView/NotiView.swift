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
                Spacer()
            }.padding(.horizontal,15).padding(.vertical,4)
            ScrollView(.vertical,showsIndicators: false){
                LazyVStack{
                    ForEach(notification.notifications){ noti in
                        NotiCellView(notification: noti)
                        Divider()
                    }
                }.padding(.horizontal,15)
            }
        }
        .navigationTitle("").navigationBarHidden(true)
    }
}

struct NotiView_Previews: PreviewProvider {
    static var previews: some View {
        NotiView()
    }
}
