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
                Group{
                    switch system.tabitem{
                    case .home :
                        HomeView()
                            .environmentObject(dataViewmodel)
                    case .search :
                        SearchView()
                    case .moit :
                        MoitView()
                    case .noti :
                        NotiView()
                    case .account :
                        AccountView()
                            .environmentObject(dataViewmodel)
                            .environmentObject(loginViewmodel)
                    }
                }.frame(maxWidth:.infinity,maxHeight: .infinity)
                TabbarView().environmentObject(system)
            }
        }.navigationViewStyle(.stack)
        //.overlay(SplashView())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
