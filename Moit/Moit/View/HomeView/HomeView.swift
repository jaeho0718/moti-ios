//
//  HomeView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI
import SwiftUIPullToRefresh

struct HomeView: View {
    @EnvironmentObject var dataViewmodel : DataViewModel
    
    var body: some View {
        VStack(spacing:0){
            TopbarView()
            ScrollView(.vertical,showsIndicators: false){
                SectionView(title: "최근", posts: $dataViewmodel.latestPost){
                    RecentMoitView()
                        .environment(\.postdetailType, .latest)
                        .environmentObject(dataViewmodel)
                }
                
                SectionView(title: "마감임박", posts: $dataViewmodel.deadlinePost){
                    RecentMoitView()
                        .environment(\.postdetailType, .deadline)
                        .environmentObject(dataViewmodel)
                }
                
                FoodListView().environmentObject(dataViewmodel)
            }
            .background(Color("GroupedBackgroundColor").ignoresSafeArea())
        }
        .navigationTitle("").navigationBarHidden(true)
        .onAppear{
            dataViewmodel.loadLatestPost()
            //dataViewmodel.loadCategories()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
                .environmentObject(DataViewModel())
        }.navigationViewStyle(.stack)
    }
}
