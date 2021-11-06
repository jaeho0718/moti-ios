//
//  ToggleStyles.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct CheckboxToggleStyle : ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing:5){
            Image(systemName: configuration.isOn ? "circle.inset.filled" : "circle.fill")
                .foregroundColor(configuration.isOn ?
                                 Color("AccentButtonColor") : Color("SecondaryTextColor"))
            configuration.label
        }
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
}
