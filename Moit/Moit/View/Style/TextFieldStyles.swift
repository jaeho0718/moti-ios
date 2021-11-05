//
//  TextFieldStyles.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import Foundation
import SwiftUI

struct SearchTextFieldStyle : TextFieldStyle {
    
    var searchAction : () -> Void
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack(spacing:0){
            Button(action:{searchAction()}){
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 24, weight: .bold, design: .default))
            }
                .padding(.leading,10)
                .foregroundColor(Color("SearchMagnitudeColor"))
            configuration
                .padding(.vertical,15)
                .padding(.trailing,5)
                .padding(.leading,9)
        }.background(Color("SearchTextFieldColor")).cornerRadius(10)
    }
}
