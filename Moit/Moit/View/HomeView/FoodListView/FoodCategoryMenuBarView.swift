//
//  FoodCategoryMenuBarView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct FoodCategoryMenuBarView: View {
    @EnvironmentObject var dataViewmodel : DataViewModel
    
    @Binding var selectedCategory : CategoryType
    
    var body: some View {
        HStack(alignment:.bottom){
            Spacer()
            ForEach(dataViewmodel.categories){ category in
                Button(action:{ selectedCategory = category.name }){
                    VStack(spacing : 5){
                        Text(category.name.icon)
                        Text(category.name.title).font(.custom("DoHyeon-Regular", size: 12))
                    }.frame(minWidth:40)
                        .foregroundColor( selectedCategory == category.name ?
                                          Color("AppAccentColor") : Color("SecondaryTextColor") )
                }.buttonStyle(PlainButtonStyle())
                Spacer()
            }
        }
    }
}

struct FoodCategoryMenuBarView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCategoryMenuBarView(selectedCategory : .constant(.pizza))
            .environmentObject(DataViewModel())
    }
}
