//
//  RestaurantCellView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct RestaurantCellView: View {
    
    @EnvironmentObject var order : OrderViewModel
    @EnvironmentObject var dataViewmodel : DataViewModel
    
    var restaurent : Restaurant
    
    var body: some View {
        NavigationLink(destination:{
            RestaurentDetailView(restaurent: restaurent)
                .environmentObject(dataViewmodel)
                .environmentObject(order)
        }){
            HStack{
                if let url = URL(string: restaurent.imageKey) {
                     AsyncImageView(url: url, placeholder: {
                         RoundedRectangle(cornerRadius: 6)
                     },image: { uiimage in
                         Image(uiImage: uiimage).resizable()
                     }).aspectRatio(contentMode: .fill).frame(width: 36, height: 36, alignment: .center)
                     .clipShape(Circle())
                 }else{
                     Circle().frame(width:36,height: 36)
                 }
                 
                Text(restaurent.name)
                    .font(.custom("DoHyeon-Regular", size: 16))
                    .foregroundColor(.black)
                Spacer(minLength: 5)
                if let fee = restaurent.fees.first?.deliveryFee {
                    Text("배달팁  \(fee)")
                        .font(.custom("DoHyeon-Regular", size: 16))
                        .foregroundColor(Color("SecondaryTextColor"))
                }
            }.frame(height:48)
        }
    }
}


 struct RestaurantCellView_Previews: PreviewProvider {
     static var previews: some View {
         RestaurantCellView(restaurent: .init(id: 0, categoryId: 1, categoryName: "치킨"
                                              , menus: [.init(id: 0, name: "허니콤보"
                                                          , price: 12000
                                                          , imageKey: "https://img.hankyung.com/photo/202102/02.24168127.1.jpg"),
                                                        .init(id: 0, name: "교촌레드스틱"
                                                                    , price: 12000
                                                                    , imageKey: "https://img.hankyung.com/photo/202102/02.24168127.1.jpg")
                                                       ]
                                              , fees: [], name: "교촌치킨", account: "0000"
                                              , imageKey: "https://img.hankyung.com/photo/202102/02.24168127.1.jpg"
                                              , openAt: "10:00", closeAt: "24:00"
                                              , createdAt: "", updatedAt: ""))
             .environmentObject(OrderViewModel())
             .environmentObject(DataViewModel())
     }
 }
 
