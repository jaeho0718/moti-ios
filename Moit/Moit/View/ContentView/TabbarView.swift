//
//  TabbarView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct TabbarView: View {
    @EnvironmentObject var system : SystemViewModel
    
    var body: some View {
        HStack{
            ForEach(SystemViewModel.TabItems.allCases){ item in
                Spacer()
                Button(action:{system.tabitem = item}){
                    Image(systemName: item.icon).font(.system(size: 20))
                        .foregroundColor(
                            system.tabitem == item ? Color("SplashScreenColor") : .secondary
                        )
                        .frame(height:35)
                }
                Spacer()
            }
        }.padding(.vertical,10)
        .background(Color.init(uiColor: .systemBackground).shadow(radius: 2).ignoresSafeArea())
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView().environmentObject(SystemViewModel())
    }
}
