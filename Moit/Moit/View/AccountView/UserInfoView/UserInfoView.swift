//
//  UserInfoView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct UserInfoView: View {
    
    var user : User
    
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
                UserInfoCell(key: "별명", value: user.name)
                UserInfoCell(key: "이메일 주소", value: user.email)
                UserInfoCell(key: "이메일 주소", value: user.phoneNumber)
                UserInfoCell(key: "학교", value: "Uni")
            }.padding(.horizontal,15)
        }.background(Color.white)
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(user: .init(id: 0, region_id: 0, university_id: 0, email: "", phoneNumber: "", name: "", point: 0, created_at: "", updated_at: ""))
    }
}

