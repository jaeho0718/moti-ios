//
//  FoodListView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct FoodListView: View {
    @EnvironmentObject var dataViewmodel : DataViewModel
    
    @State var selectedCategory : CategoryType = .pizza
    
    var body: some View {
        VStack(spacing : 0){
            HStack{
                Text("음식별로 모아보기").font(.custom("DoHyeon-Regular", size: 18))
                    .foregroundColor(Color("SectionTextColor"))
                Spacer(minLength: 0)
            }.padding(.horizontal,18)
            .padding(.top,14)
            
            FoodCategoryMenuBarView(selectedCategory: $selectedCategory)
                .padding(.horizontal,3)
                .padding(.top,14)
            
            LazyVStack(spacing:10){
                //filter 추가하기
                ForEach(dataViewmodel.Posts.prefix(5)){ post in
                    PostMidiumView(post: post)
                }.padding(.horizontal,18)
            }.padding(.top,15)
            .padding(.bottom,46)
        }.background(Color.white.ignoresSafeArea())
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView()
            .environmentObject(DataViewModel())
    }
}
