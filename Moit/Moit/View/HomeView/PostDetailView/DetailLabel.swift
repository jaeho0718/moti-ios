//
//  DetailLabel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct DetailLabel<Content : View>: View {
    
    var title : LocalizedStringKey
    var icon : String
    var content : ()->Content
    
    init(icon : String, title : LocalizedStringKey, @ViewBuilder content : @escaping ()->Content){
        self.title = title
        self.icon = icon
        self.content = content
    }
    
    var body: some View {
        HStack(alignment:.top){
            Image(systemName: icon)
                .imageScale(.small)
                .foregroundColor(Color("SecondaryTextColor"))
            VStack(alignment:.leading){
                Text(title)
                    .font(.custom("DoHyeon-Regular", size: 16))
                    .foregroundColor(Color("SecondaryTextColor"))
                content()
            }
            Spacer(minLength: 0)
        }
    }
}
