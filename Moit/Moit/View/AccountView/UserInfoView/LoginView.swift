//
//  LoginView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack{
            HStack{
                Text("로그인").font(.custom("DoHyeon-Regular", size: 28))
                    .foregroundColor(.black)
                Spacer()
            }.padding(.horizontal,15)
            .padding(.top,20)
            .padding(.bottom,5)
            
            
        }.background(Color.white)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
