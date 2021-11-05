//
//  SplashView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct SplashView: View {
    @State private var isOpen : Bool = true
    
    var body: some View {
        ZStack(alignment:.topTrailing){
            if isOpen{
                Rectangle()
                    .foregroundColor(Color("SplashScreenColor"))
                    .ignoresSafeArea()
                VStack(alignment:.trailing){
                    Group{
                        Text("한번에")
                        Text("빠르게")
                        Text("moit")
                    }.font(.system(size: 49, weight: .heavy, design: .default))
                    .foregroundColor(.white)
                }.padding(.top,130)
                .padding(.trailing,29)
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5
            ,execute: {
                withAnimation(.easeInOut){
                    isOpen = false
                }
            })
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
