//
//  CustomNotiView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

///사용자에게 알림을 보낼 때 쓰는 뷰
struct CustomNotiView : View {
    
    @Binding var check : Bool
    
    var title : LocalizedStringKey
    var content : LocalizedStringKey
    
    var cancleTitle : LocalizedStringKey
    var confirmTitle : LocalizedStringKey
    
    var cancelAction : () -> Void
    var confirmAction : () -> Void
    
    
    var body: some View {
        VStack(alignment:.leading, spacing:0){
            Text(title)
                .font(.custom("DoHyeon-Regular", size: 18))
                .foregroundColor(.white)
                .padding(.bottom,5).padding(.top,10)
                .frame(maxWidth:.infinity,alignment:.leading).padding(.horizontal)
                .background(Color("AccentButtonColor"))
            Text(content)
                .font(.custom("DoHyeon-Regular", size: 14))
                .padding(.top,19)
                .padding(.horizontal)
            Spacer()
            HStack{
                Button(action:{
                    cancelAction()
                    check.toggle()
                }){
                    Text(cancleTitle)
                        .font(.custom("DoHyeon-Regular", size: 14))
                        .frame(maxWidth:.infinity,minHeight:28)
                }
                .accentColor(Color("SecondaryTextColor"))
                
                Button(action:{
                    confirmAction()
                    check.toggle()
                }){
                    Text(confirmTitle)
                        .font(.custom("DoHyeon-Regular", size: 14))
                        .frame(maxWidth:.infinity,minHeight:28)
                }.accentColor(Color("AccentButtonColor"))
            }
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment:.leading)
        .background(Color.white)
        .cornerRadius(10)
    }
}
