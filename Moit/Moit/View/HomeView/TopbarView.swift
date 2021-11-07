//
//  TopbarView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct TopbarView: View {
    @EnvironmentObject var login : LoginViewModel
    @EnvironmentObject var dataViewmodel : DataViewModel
    
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                if let user = login.user {
                    Text(user.universityName)
                        .font(.custom("DoHyeon-Regular", size: 23))
                } else {
                    Text("로그인 해주세요.")
                        .font(.custom("DoHyeon-Regular", size: 23))
                }
            }
            
            Spacer()
            Button(action:{
                dataViewmodel.loadLatestPost()
            }){
                Image(systemName: "arrow.clockwise.circle.fill").font(.system(size: 20))
            }
        }.padding(.horizontal)
            .padding(.top).padding(.bottom,8)
        .foregroundColor(Color("AppAccentColor"))
        .background(Color.white.ignoresSafeArea())
        
    }
}

struct TopbarView_Previews: PreviewProvider {
    static var previews: some View {
        TopbarView()
            .environmentObject(LoginViewModel())
            .environmentObject(DataViewModel())
    }
}
