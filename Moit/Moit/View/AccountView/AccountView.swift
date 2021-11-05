//
//  AccountView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var dataViewmodel : DataViewModel
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            UserInfoView()
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
    }
}
