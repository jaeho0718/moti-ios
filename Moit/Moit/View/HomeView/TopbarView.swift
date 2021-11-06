//
//  TopbarView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct TopbarView: View {
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text("중앙대")
                    .font(.custom("DoHyeon-Regular", size: 25))
                Text("서울캠퍼스")
                    .font(.custom("DoHyeon-Regular", size: 12))
            }
            Spacer()
            Button(action:{}){
                Image(systemName: "gearshape.fill").font(.system(size: 20))
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
    }
}
