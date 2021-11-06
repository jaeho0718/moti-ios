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
    
    @State private var size : CGSize = .zero
    @Binding var show : Bool
    
    var alertContent : () -> AlertContent
    
    init(show : Binding<Bool> ,@ViewBuilder alert : @escaping () -> AlertContent ){
        self.alertContent = alert
        self._show = show
    }
    
    var sizeChecker : some View {
        GeometryReader{ geometry in
            Color.clear.preference(key: ViewPreferenceKey.self, value: geometry.size)
        }
    }
    
    func body(content: Content) -> some View {
        content
            .background(sizeChecker)
            .overlay(CustomAlertView(size: $size,show: $show,content: alertContent))
            .onPreferenceChange(ViewPreferenceKey.self, perform: { value in
                size = value
            })
    }
}

fileprivate struct ViewPreferenceKey : PreferenceKey {
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
    
    static var defaultValue : CGSize = .zero
}

struct CustomAlertView<Content : View> : View {
    @Binding var size : CGSize
    @Binding var show : Bool
    
    var content : () -> Content
    
    var body: some View{
        ZStack(alignment:.center){
            if show {
                Rectangle()
                    .foregroundColor(.black).opacity(0.2).ignoresSafeArea()
                content()
                    .frame(width: size.width*0.7 , height: size.width*0.7*139/240, alignment: .leading)
            }
        }
    }
}
