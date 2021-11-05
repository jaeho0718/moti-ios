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
                Text("중앙대").font(.system(size: 25, weight: .bold, design: .default))
                Text("서울캠퍼스").font(.system(size: 12, weight: .medium, design: .default))
            }
            Spacer()
            Button(action:{}){
                Image(systemName: "gearshape.fill").font(.system(size: 20))
            }
        }.padding(.horizontal,10)
        .foregroundColor(Color("SplashScreenColor"))
        .background(Color(uiColor: .systemBackground).ignoresSafeArea())
    }
}

struct TopbarView_Previews: PreviewProvider {
    static var previews: some View {
        TopbarView()
    }
}
