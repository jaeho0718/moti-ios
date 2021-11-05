//
//  ContentView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct ContentView: View {
    @StateObject var system = SystemViewModel()
    
    var body: some View {
        VStack(spacing:0){
            TopbarView()
            TabView(selection: $system.tabitem){
                HomeView().tag(SystemViewModel.TabItems.home)
                SearchView().tag(SystemViewModel.TabItems.search)
                PointView().tag(SystemViewModel.TabItems.point)
                NotiView().tag(SystemViewModel.TabItems.noti)
                AccountView().tag(SystemViewModel.TabItems.account)
            }.tabViewStyle(.page(indexDisplayMode: .never))
            TabbarView().environmentObject(system)
        }
        .overlay{
            SplashView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
