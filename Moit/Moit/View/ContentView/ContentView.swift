//
//  ContentView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct ContentView: View {
    @StateObject var system = SystemViewModel()
    @StateObject var dataViewmodel = DataViewModel()
    
    var body: some View {
        NavigationView{
            VStack(spacing:0){
                TopbarView()
                TabView(selection: $system.tabitem){
                    HomeView()
                        .tag(SystemViewModel.TabItems.home)
                        .environmentObject(dataViewmodel)
                    SearchView()
                        .tag(SystemViewModel.TabItems.search)
                    PointView()
                        .tag(SystemViewModel.TabItems.point)
                    NotiView()
                        .tag(SystemViewModel.TabItems.noti)
                    AccountView()
                        .tag(SystemViewModel.TabItems.account)
                }
                TabbarView().environmentObject(system)
            }
        }.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
