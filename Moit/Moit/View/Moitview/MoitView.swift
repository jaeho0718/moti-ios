//
//  MoitView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct MoitView: View {
    
    @EnvironmentObject var dataViewmodel : DataViewModel
    @StateObject var order = OrderViewModel()
    
    @State private var results : [Restaurant] = []
    
    @State private var onLoad : Bool = false
    @State private var searchText : String = ""
    
    var body: some View {
        VStack(alignment:.leading){
            VStack(alignment:.leading,spacing : 5){
                Text("새 모잇 만들기").font(.custom("DoHyeon-Regular", size: 28))
                    .foregroundColor(.black)
                Text(order.type == .share ? "나누어 먹을래요" : "모여서 단건배달")
                    .font(.custom("DoHyeon-Regular", size: 14))
                    .foregroundColor(Color("AppAccentColor"))
            }.frame(maxWidth:.infinity,alignment: .leading)
            
            TextField("음식점 검색",text: $searchText,onCommit: {
                onLoad = true
                dataViewmodel.searchRestaurant(text: searchText
                    ,completion: { response in
                    onLoad = false
                    do{
                        self.results = try response.get()
                    } catch {
                        
                    }
                })
            })
            .textFieldStyle(BorderedTextFieldStyle())
            .padding(.top,22)
            
            
            ScrollView(.vertical,showsIndicators: false){
                ForEach(results){ restaurant in
                    RestaurantCellView(restaurent: restaurant)
                        .environmentObject(order)
                    Divider()
                }
            }
        }.padding(.horizontal,15)
        .navigationTitle("").navigationBarHidden(true)
    }
}

struct MoitView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MoitView()
                .environmentObject(DataViewModel())
        }.navigationViewStyle(.stack)
    }
}
