//
//  UserInfoView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct UserInfoView: View {
    var body: some View {
        VStack{
            HStack{
                Text("내 정보").font(.custom("DoHyeon-Regular", size: 28))
                    .foregroundColor(.black)
                Spacer()
                MoitManerView(score: 4.0)
            }.padding(.horizontal,15)
            .padding(.top,20)
            .padding(.bottom,5)
            
            Section{ 
                UserInfoCell(key: "별명", value: "불타는 고구마")
                UserInfoCell(key: "이메일 주소", value: "xxx@xxxx.com")
                UserInfoCell(key: "이메일 주소", value: "010-0000-0000")
                UserInfoCell(key: "학교", value: "Uni")
            }.padding(.horizontal,15)
        }.background(Color.white)
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}

