//
//  HomeView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataViewmodel : DataViewModel
    
    var body: some View {
        ScrollView{
            SectionView(title: "최근", posts: $dataViewmodel.latestPosts){}
            
            SectionView(title: "마감임박", posts: $dataViewmodel.latestPosts){}
        }
        .navigationTitle("").navigationBarHidden(true)
        .background(Color("GroupedBackgroundColor").ignoresSafeArea())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(DataViewModel())
    }
}
