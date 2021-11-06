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
            RefreshableScrollView(showsIndicators: false, onRefresh: { done in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    done()
                }
            }, progress: { state in
                Group{
                    if state == .waiting {
                        Text("당겨서 새로고침하기")
                    } else if state == .primed {
                        Text("새로고침 시작")
                    } else {
                        Text("로딩중")
                    }
                }.font(.custom("DoHyeon-Regular", size: 12))
            }){
                VStack{
                    SectionView(title: "최근", posts: $dataViewmodel.Posts){RecentMoitView()}
                    
                    SectionView(title: "마감임박", posts: $dataViewmodel.Posts){}
                    
                    FoodListView()
                }
            }
            .background(Color("GroupedBackgroundColor").ignoresSafeArea())
        }
        .navigationTitle("").navigationBarHidden(true)
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
