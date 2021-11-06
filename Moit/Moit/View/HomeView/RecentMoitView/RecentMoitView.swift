//
//  RecentMoitView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct RecentMoitView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var dataViewmodel : DataViewModel
    
    @State private var tabitem : TabType = .share
    
    enum TabType : Identifiable {
        case share,together
        var id : Int {
            switch self {
            case .share:
                return 0
            case .together:
                return 1
            }
        }
    }
    
    var body: some View {
        VStack(spacing:0){
            HStack{
                Button(action:{
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                }.accentColor(Color("SecondaryTextColor"))
                Text("최근 모잇").font(.custom("DoHyeon-Regular", size: 28))
                    .foregroundColor(.black)
                Spacer()
            }.padding(.vertical)
                .padding(.horizontal)
            
            HStack{
                Button(action:{tabitem = .share}){
                    Text("나누어 먹을래요")
                        .font(.custom("DoHyeon-Regular", size: 20))
                        .frame(maxWidth:.infinity,minHeight: 50)
                }.accentColor(tabitem == .share ? .black : Color("SecondaryTextColor"))
                Button(action:{tabitem = .together}){
                    Text("모여서 단건배달")
                        .font(.custom("DoHyeon-Regular", size: 20))
                        .frame(maxWidth:.infinity,minHeight: 50)
                }.accentColor(tabitem == .together ? .black : Color("SecondaryTextColor"))
            }
            
            Divider()
            
            ScrollView(.vertical,showsIndicators: false){
                ForEach(dataViewmodel.Posts){ post in
                    PostLargeCellView(post: post)
                        .environment(\.postType, tabitem)
                        .padding(.top,dataViewmodel.Posts.first?.id == post.id ? 10 : 0)
                }
            }.padding(.horizontal,17)
        }
        .navigationTitle("").navigationBarHidden(true)
    }
}

struct RecentMoitView_Previews: PreviewProvider {
    static var previews: some View {
        RecentMoitView()
            .environmentObject(DataViewModel())
    }
}
