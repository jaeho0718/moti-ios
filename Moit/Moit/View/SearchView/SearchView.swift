//
//  SearchView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var dataViewemodel : DataViewModel
    @State private var searchText : String = ""
    @State private var result : [Post] = []
    
    var body: some View {
        VStack{
            TextField("오늘은 어떤 음식을 모잇할까요?", text: $searchText,onCommit: {
                if !searchText.isEmpty {
                    dataViewemodel.searchPost(text: searchText, completion: {
                        response in
                        switch response {
                        case .success(let value):
                            result = value
                        case .failure(let error):
                            print("Sort Search Error : \(error.localizedDescription)")
                        }
                    })
                }
            })
            .textFieldStyle(SearchTextFieldStyle(searchAction: {})).padding(.horizontal)
            .padding(.top)
            .foregroundColor(.black)
            
            ScrollView(.vertical,showsIndicators: false){
                ForEach(result){ post in
                    PostLargeCellView(post: post)
                }
            }.padding(.horizontal,15)
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
