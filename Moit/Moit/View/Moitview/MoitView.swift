//
//  MoitView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI
import AlertToast

struct MoitView: View {
    
    @EnvironmentObject var dataViewmodel : DataViewModel
    @StateObject var order = OrderViewModel()
    
    @State private var results : [Restaurant] = []
    @State private var chooseType : Bool = true
    @State private var onLoad : Bool = false
    @State private var searchText : String = ""
    
    var body: some View {
        VStack(alignment:.leading){
            VStack(alignment:.leading,spacing : 5){
                HStack{
                    Text("새 모잇 만들기").font(.custom("DoHyeon-Regular", size: 28))
                    Spacer(minLength: 0)
                    Menu(content: {
                        ForEach(OrderType.allCases){ type in
                            Button(action:{order.type = type}){
                                Text(type.title)
                                    .font(.custom("DoHyeon-Regular", size: 14))
                            }
                        }
                    }, label: {
                        HStack{
                            Text(order.type.title)
                                .font(.custom("DoHyeon-Regular", size: 14))
                            Image(systemName: "chevron.down")
                        }.foregroundColor(Color("AppAccentColor"))
                    })
                }.foregroundColor(.black).padding(.top,15)
            }.frame(maxWidth:.infinity,alignment: .leading)
            
            TextField("음식점 검색",text: $searchText,onCommit: {
                if !searchText.isEmpty {
                    onLoad = true
                    dataViewmodel.searchRestaurant(text: searchText
                        ,completion: { response in
                        switch response {
                        case .success(let result) :
                            self.results = result
                        case .failure(let error) :
                            print("Search Error : \(error.localizedDescription)")
                        }
                        onLoad = false
                    })
                }
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
        .background(Color.white.ignoresSafeArea())
        .navigationTitle("").navigationBarHidden(true)
        .onAppear{
            chooseType = true
        }
        .toast(isPresenting: $onLoad, alert: {
            AlertToast(displayMode: .alert, type: .loading)
        })
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
