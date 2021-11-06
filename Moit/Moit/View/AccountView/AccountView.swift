//
//  AccountView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var dataViewmodel : DataViewModel
    @EnvironmentObject var login : LoginViewModel
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            if let user = login.user {
                UserInfoView(user: user)
            } else {
                
            }
            PointView()
            UsageListView(usageDatas: $dataViewmodel.usageItems)
        }
        .background(Color("GroupedBackgroundColor").ignoresSafeArea())
        .navigationTitle("").navigationBarHidden(true)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView().environmentObject(DataViewModel())
            .environmentObject(LoginViewModel())
    }
}
