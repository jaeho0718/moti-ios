//
//  RestaurentDetailView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct RestaurentDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var order : OrderViewModel
    @EnvironmentObject var dataViewmodel : DataViewModel
    
    var restaurent : Restaurant
    
    var body: some View {
        VStack{
    
            HStack{
                Button(action:{
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                }.accentColor(Color("SecondaryTextColor"))
                Spacer()
            }.padding(.vertical)
            
            VStack(alignment:.leading,spacing : 5){
                Text("새 모잇 만들기").font(.custom("DoHyeon-Regular", size: 28))
                    .foregroundColor(.black)
                Text(order.type == .share ? "나누어 먹을래요" : "모여서 단건배달")
                    .font(.custom("DoHyeon-Regular", size: 14))
                    .foregroundColor(Color("AppAccentColor"))
            }.frame(maxWidth:.infinity,alignment: .leading)
            
            HStack{
                Text(restaurent.name)
                    .font(.custom("DoHyeon-Regular", size: 16))
                    .foregroundColor(.black)
                Spacer(minLength: 5)
                /*
                 Text("배달팁  \(restaurent.fees.first ?? "")")
                     .font(.custom("DoHyeon-Regular", size: 16))
                     .foregroundColor(Color("SecondaryTextColor"))
                 */
            }
            .padding(.horizontal,9)
            .frame(height:36)
            .background(RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color("RestaurentCellColor")))
            .padding(.top,17)
            
            HStack(alignment:.bottom, spacing:6){
                Text("메뉴")
                    .font(.custom("DoHyeon-Regular", size: 20))
                    .foregroundColor(Color("SectionTextColor"))
                Text("복수 선택 가능합니다.")
                    .font(.custom("DoHyeon-Regular", size: 12))
                    .foregroundColor(Color("SecondaryTextColor"))
                Spacer()
                NavigationLink(destination:{
                    PaymentView(restaurent: restaurent).environmentObject(order)
                        .environmentObject(dataViewmodel)
                }){
                    Text("선택완료")
                        .font(.custom("DoHyeon-Regular", size: 12))
                        .foregroundColor(.white)
                        .padding(.horizontal,9)
                        .padding(.vertical,6)
                }
                .background(RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color("AccentButtonColor")))
                .disabled(!order.menus.contains(where: {$0.isSelected}))
                
            }.padding(.top,23)
            
            ScrollView(.vertical,showsIndicators: false){
                LazyVStack(spacing:0){
                    ForEach($order.menus){ menu in
                        MenuCell(menu: menu)
                        Divider()
                    }
                }
            }
        }.padding(.horizontal,15)
        .navigationTitle("").navigationBarHidden(true)
        .onAppear{
            order.generageMenus(restaurent: restaurent)
        }
    }
}

/*
 struct RestaurentDetailView_Previews: PreviewProvider {
     static var previews: some View {
         RestaurentDetailView(restaurent:.init(id: <#T##Int#>, category_id: <#T##Int#>, categoryName: <#T##String#>, menus: <#T##[String]#>, fees: <#T##[String]#>, name: <#T##String#>, openAt: <#T##String#>, closeAt: <#T##String#>))
             .environmentObject(DataViewModel())
             .environmentObject(OrderViewModel())
     }
 }
 */


struct MenuCell : View {
    
    @Binding var menu : MenuData
    
    var body: some View {
        Button(action:{ menu.isSelected.toggle() }){
            HStack{
                Text(menu.name).font(.custom("DoHyeon-Regular", size: 14))
                Spacer()
                Text("\(menu.price)원").font(.custom("DoHyeon-Regular", size: 14))
            }
            .accentColor(menu.isSelected ? Color("AccentButtonColor") : .black)
            .frame(height:36)
        }
    }
}
