//
//  PointView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct PointView: View {
    @EnvironmentObject var login : LoginViewModel
    
    var body: some View {
        VStack(spacing:0){
            HStack{
                Text("내 포인트").font(.custom("DoHyeon-Regular", size: 28))
                    .foregroundColor(.black)
                Spacer()
            }.padding(.horizontal,15)
            .padding(.vertical,15)
            
            VStack(alignment:.leading, spacing:0){
                Text("\(login.user?.point ?? 0)P").font(.custom("DoHyeon-Regular", size: 30))
                    .padding(.leading,16).padding(.vertical,12)
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .leading)
                HStack(spacing:1){
                    Group{
                        Button(action:{
                            //선물버튼
                        },label: {
                            Text("선물")
                                .font(.custom("DoHyeon-Regular", size: 16))
                                .foregroundColor(.white)
                                .frame(maxWidth:.infinity,maxHeight: 41)
                        })
                        Button(action:{
                            //충전버튼
                        },label: {
                            Text("충전")
                                .font(.custom("DoHyeon-Regular", size: 16))
                                .foregroundColor(.white)
                                .frame(maxWidth:.infinity,maxHeight: 41)
                        })
                    }
                    .background(Color("PurchaseButtonColor"))
                }
            }.frame(height:100,alignment: .leading)
            .background(Color("PointGroupBoxColor"))
            .cornerRadius(10)
            .padding(.horizontal,15)
            .padding(.bottom,15)
        }.background(Color.white.ignoresSafeArea())
    }
}

struct PointView_Previews: PreviewProvider {
    static var previews: some View {
        PointView()
    }
}
