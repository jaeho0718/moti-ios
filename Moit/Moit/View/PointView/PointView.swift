//
//  PointView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct PointView: View {
    var body: some View {
        ScrollView{
            
        }
        .background(Color("GroupedBackgroundColor").ignoresSafeArea())
        .navigationTitle("").navigationBarHidden(true)
    }
}

struct PointView_Previews: PreviewProvider {
    static var previews: some View {
        PointView()
    }
}
