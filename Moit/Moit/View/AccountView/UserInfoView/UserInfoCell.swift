//
//  UserInfoCell.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct UserInfoCell : View {
    
    var key : LocalizedStringKey
    var value : LocalizedStringKey
    
    var body: some View {
        HStack{
            Text(key).font(.custom("DoHyeon-Regular", size: 16))
            Spacer(minLength: 10)
            Text(value).font(.custom("DoHyeon-Regular", size: 16))
        }.frame(height:48).foregroundColor(.black)
    }
}


struct UserInfoCell_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoCell(key: "Hello", value: "world")
    }
}
