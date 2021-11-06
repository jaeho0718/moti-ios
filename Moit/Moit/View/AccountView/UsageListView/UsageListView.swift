//
//  UsageListView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct UsageListView: View {
    @Binding var usageDatas : [Usage]
    
    var body: some View {
        VStack(spacing:0){
            HStack{
                VStack(alignment:.leading, spacing: 0){
                    HStack(alignment:.center,spacing:10){
                        Text("이번달 사용내역").font(.custom("DoHyeon-Regular", size: 28))
                            .foregroundColor(.black)
                        Text("5건").font(.custom("DoHyeon-Regular", size: 20))
                            .foregroundColor(Color("SecondaryTextColor"))
                    }
                    HStack(spacing:15){
                        Text("총사용 포인트")
                        Text("36500 P")
                    }.font(.custom("DoHyeon-Regular", size: 14))
                        .foregroundColor(.black)
                        .padding(.top,12)
                }
                Spacer()
            }.padding(.horizontal,15)
            .padding(.top,40)
            .padding(.bottom,22)
            Section{
                ForEach(usageDatas){ usage in
                    VStack(alignment:.leading){
                        Text(usage.date.noti_date).font(.custom("DoHyeon-Regular", size: 12))
                        HStack{
                            Text(usage.restraunt).font(.custom("DoHyeon-Regular", size: 12))
                            Spacer(minLength: 0)
                            Text("\(usage.point) P").font(.custom("DoHyeon-Regular", size: 14))
                        }
                    }.frame(height:53)
                    .foregroundColor(.black)
                    Divider()
                }
            }
            .padding(.horizontal,15)
        }.padding(.bottom,219).background(Color.white)
    }
}

struct UsageListView_Previews: PreviewProvider {
    static var previews: some View {
        UsageListView(usageDatas: .constant([
            .init(id: 0, date: Date(), point: 10000, restraunt: "교촌치킨 중앙대점")
            ,.init(id: 1, date: Date(), point: 10000, restraunt: "교촌치킨 중앙대점")
        ]))
    }
}
