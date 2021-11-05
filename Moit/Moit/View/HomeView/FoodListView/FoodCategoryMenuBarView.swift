//
//  FoodCategoryMenuBarView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct FoodCategoryMenuBarView: View {
    @Binding var selectedCategory : CategoryType
    
    var body: some View {
        HStack(alignment:.bottom){
            Spacer()
            ForEach(CategoryType.allCases){ category in
                Button(action:{ selectedCategory = category }){
                    VStack(spacing : 5){
                        Text(category.icon)
                        Text(category.title).font(.custom("DoHyeon-Regular", size: 12))
                    }.frame(minWidth:40)
                        .foregroundColor( selectedCategory == category ?
                                          Color("AppAccentColor") : .secondary )
                }.buttonStyle(PlainButtonStyle())
                Spacer()
            }
        }
    }
}

struct FoodCategoryMenuBarView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCategoryMenuBarView(selectedCategory : .constant(.pizza))
    }
}
