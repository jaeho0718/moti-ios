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
    @StateObject var loginViewmodel = LoginViewModel()
    
    var body: some View {
        NavigationView{
            VStack(spacing:0){
                ZStack{
                    HomeView()
                        .environmentObject(dataViewmodel)
                        .opacity(system.tabitem == SystemViewModel.TabItems.home ? 1 : 0)
                    SearchView()
                        .environmentObject(dataViewmodel)
                        .opacity(system.tabitem == SystemViewModel.TabItems.search ? 1 : 0)
                    MoitView()
                        .environmentObject(dataViewmodel)
                        .opacity(system.tabitem == SystemViewModel.TabItems.moit ? 1 : 0)
                    NotiView()
                        .opacity(system.tabitem == SystemViewModel.TabItems.noti ? 1 : 0)
                    AccountView()
                        .environmentObject(dataViewmodel)
                        .environmentObject(loginViewmodel)
                        .opacity(system.tabitem == SystemViewModel.TabItems.account ? 1 : 0)
                }.frame(maxWidth:.infinity,maxHeight: .infinity)
                TabbarView().environmentObject(system)
            }
        }.navigationViewStyle(.stack)
        .overlay(SplashView())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
