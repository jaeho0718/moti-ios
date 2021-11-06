//
//  SearchView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText : String = ""
    
    
    var body: some View {
        VStack{
            
            TextField("오늘은 어떤 음식을 모잇할까요?", text: $searchText)
                .textFieldStyle(SearchTextFieldStyle(searchAction: {})).padding(.horizontal)
                .padding(.top)
                .foregroundColor(.black)
            
            ScrollView{
                
            }
        }
        .background(Color.white.ignoresSafeArea())
        .navigationTitle("").navigationBarHidden(true)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
