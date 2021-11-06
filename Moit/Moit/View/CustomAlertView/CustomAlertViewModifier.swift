//
//  CustomAlertViewModifier.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

extension View {
    func customAlert<AlertContent : View>(show : Binding<Bool>
                            ,@ViewBuilder alert : @escaping () -> AlertContent) -> some View {
        self.modifier(CustomAlertModifier(show: show, alert: alert))
    }
}

struct CustomAlertModifier <AlertContent : View> : ViewModifier {
    
    @Binding var show : Bool
    
    var alertContent : () -> AlertContent
    
    init(show : Binding<Bool> ,@ViewBuilder alert : @escaping () -> AlertContent ){
        self.alertContent = alert
        self._show = show
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(CustomAlertView(show: $show,content: alertContent))
            
    }
}


struct CustomAlertView<Content : View> : View {
    @Binding var show : Bool
    
    var content : () -> Content
    
    var body: some View{
        GeometryReader{ geometry in
            ZStack(alignment:.center){
                if show {
                    Rectangle()
                        .foregroundColor(.black).opacity(0.2).ignoresSafeArea()
                    content()
                        .frame(width: geometry.size.width*0.7 ,
                               height: geometry.size.width*0.7*139/240, alignment: .leading)
                }
            }
        }
    }
}
