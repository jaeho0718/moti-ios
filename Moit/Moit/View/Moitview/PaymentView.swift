//
//  PaymentView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct PaymentView: View {
    
    @EnvironmentObject var order : OrderViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var check : Bool = false
    @State private var done : Bool = false
    
    var restaurent : Restaurant
    
    var body: some View {
        VStack(spacing:0){
            HStack{
                Button(action:{
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                }.accentColor(Color("SecondaryTextColor"))
                Spacer()
            }.padding(.vertical)
            ScrollView(.vertical,showsIndicators: false){
                VStack(alignment:.leading,spacing : 5){
                    Text(order.type == .share ? "나누어 먹을래요" : "모여서 단건배달")
                        .font(.custom("DoHyeon-Regular", size: 28))
                        .foregroundColor(.black)
                    Text("나누어 먹을래요").font(.custom("DoHyeon-Regular", size: 14))
                        .foregroundColor(Color("AppAccentColor"))
                }.frame(maxWidth:.infinity,alignment: .leading)
                
                VStack(spacing : 0){
                    HStack{
                        Text("메뉴")
                            .font(.custom("DoHyeon-Regular", size: 20))
                            .foregroundColor(Color("SectionTextColor"))
                        Spacer(minLength: 0)
                        Button(action:{presentationMode.wrappedValue.dismiss()}){
                            Text("수정").font(.custom("DoHyeon-Regular", size: 14))
                                .foregroundColor(.white)
                                .padding(.vertical,10)
                                .padding(.horizontal,9)
                        }.background(RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(Color("AccentButtonColor")))
                    }
                    ForEach(order.menus.filter({$0.isSelected})){ menu in
                        HStack{
                            Text(menu.title).font(.custom("DoHyeon-Regular", size: 14))
                            Spacer()
                            Text("\(menu.price)원").font(.custom("DoHyeon-Regular", size: 14))
                        }.frame(height:36)
                    }
                }
                .padding(.top,13)
                
                HStack{
                    VStack(alignment:.leading){
                        Text(order.type == .share ? "모집 인원" : "나누어 먹을 인원")
                            .font(.custom("DoHyeon-Regular", size: 20))
                            .foregroundColor(Color("SectionTextColor"))
                        Text(order.type == .share ? "달성 시 주문 확정 알림을 보내드려요." : "주문자 포함")
                            .font(.custom("DoHyeon-Regular", size: 12))
                            .foregroundColor(Color("SecondaryTextColor"))
                    }
                    Spacer()
                    HStack(spacing:0){
                        Button(action:{order.count -= 1}){
                            Image(systemName: "minus").imageScale(.medium).foregroundColor(.white)
                        }
                        .disabled(order.count <= 1)
                        .frame(width:33,height:36).background(Color("AccentButtonColor"))
                        Text("\(order.count)")
                            .font(.custom("DoHyeon-Regular", size: 16))
                            .foregroundColor(Color("SecondaryTextColor"))
                            .frame(minWidth:33)
                        Button(action:{order.count += 1}){
                            Image(systemName: "plus").imageScale(.medium).foregroundColor(.white)
                        }
                        .frame(width:33,height:36).background(Color("AccentButtonColor"))
                    }.cornerRadius(8)
                }
                .padding(.top,11)
                
                VStack(alignment:.leading,spacing : 0){
                    Text("결제 예정 포인트")
                        .font(.custom("DoHyeon-Regular", size: 20))
                        .foregroundColor(Color("SectionTextColor"))
                    Text(order.type == .share ?
                         "배달팁을 인원수로 나눈 값과 메뉴 가격을 합친 가격입니다." : "주문 가격을 인원수로 나눈 결과입니다.")
                        .font(.custom("DoHyeon-Regular", size: 12))
                        .foregroundColor(Color("SecondaryTextColor"))
                        .padding(.top,7)
                    Text("\(order.totalPrice())원")
                        .font(.custom("DoHyeon-Regular", size: 20))
                        .foregroundColor(.black)
                        .padding(.top,7)
                }.frame(maxWidth:.infinity,alignment: .leading)
                .padding(.top,11)
                
                if order.type == .share {
                    VStack(alignment:.leading,spacing : 0){
                        Text("음식을 받을 곳")
                            .font(.custom("DoHyeon-Regular", size: 20))
                            .foregroundColor(Color("SectionTextColor"))
                        Text("주문자의 주소로 배달됩니다.")
                            .font(.custom("DoHyeon-Regular", size: 12))
                            .foregroundColor(Color("SecondaryTextColor"))
                            .padding(.top,7)
                        Text("중앙대학교 서울캠퍼스 기숙사 308관")
                            .font(.custom("DoHyeon-Regular", size: 16))
                            .foregroundColor(.black)
                            .padding(.top,7)
                    }.frame(maxWidth:.infinity,alignment: .leading)
                    .padding(.top,15)
                    
                    VStack(alignment:.leading,spacing : 0){
                        Text("소분용 그릇이 필요한가요?")
                            .font(.custom("DoHyeon-Regular", size: 20))
                            .foregroundColor(Color("SectionTextColor"))
                        Text("환경을 생각하는 중앙대학교 학생이 되어주세요!")
                            .font(.custom("DoHyeon-Regular", size: 12))
                            .foregroundColor(Color("SecondaryTextColor"))
                            .padding(.top,7)
                        HStack{
                            Toggle("아니요! 각자 준비할께요.", isOn: Binding<Bool>(get: {!order.needBowl}
                                ,set: {value in order.needBowl = value ? false : true}))
                                .toggleStyle(CheckboxToggleStyle())
                                .font(.custom("DoHyeon-Regular", size: 14))
                            
                            Toggle("네! 필요해요.", isOn: Binding<Bool>(get: {order.needBowl}, set: {
                                value in order.needBowl = value ? true : false
                            }))
                                .toggleStyle(CheckboxToggleStyle())
                                .font(.custom("DoHyeon-Regular", size: 14))
                                .padding(.leading,39)
                        }.padding(.top,10)
                    }.frame(maxWidth:.infinity,alignment: .leading)
                    .padding(.top,15)
                }
                
                VStack(alignment:.leading,spacing : 0){
                    HStack{
                        Text("요청사항")
                            .font(.custom("DoHyeon-Regular", size: 20))
                            .foregroundColor(Color("SectionTextColor"))
                        Spacer(minLength: 0)
                    }
                    TextField("식당에 요청할 사항을 입력해주세요.", text: $order.request)
                        .font(.custom("DoHyeon-Regular", size: 16))
                        .textFieldStyle(LineTextFieldStyle())
                        .padding(.top,10)
                }
                .padding(.top,15)
                
                HStack{
                    Spacer()
                    Button(action:{
                        check.toggle()
                    }){
                        Text("등록하기")
                            .foregroundColor(.white)
                            .font(.custom("DoHyeon-Regular", size: 16))
                            .frame(height:34)
                            .padding(.horizontal,8)
                            .padding(.vertical,1)
                    }.background(RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color("AccentButtonColor")))
                }.padding(.top,34)
            }
        }
        .padding(.horizontal,15)
        .frame(maxHeight:.infinity,alignment: .topLeading)
        .overlay(DoneView(done:$done))
        .customAlert(show: $check, alert: {
            CustomNotiView(check: $check, title: "확인 부탁드립니다.",
                           content: "\(order.totalPrice()) 포인트가 차감되며 주문 실패시 고객님의 계정으로 반환합니다.",
                           cancleTitle: "등록 취소", confirmTitle: "확인",
                           cancelAction: {}, confirmAction: {done.toggle()})
        })
        .navigationTitle("").navigationBarHidden(true)
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView(restaurent: .init(id: 0, category_id: 0, open_at: 0, close_at: 0,
                                      location_id: 0, delivery_fee: 5000, account: "교촌치킨 중앙대후문점" , imageURL: "https://lh3.googleusercontent.com/proxy/CzSkRGTFEGRdBM8mq-WPgGWBgwzZT5dfmMAnA15zVmSVRrXbVzLIfsVfVyU3jtZIIh71Wu013tH_H2NRfALYsFYapXvLQ-8ulCp7rg"))
            .environmentObject(OrderViewModel())
    }
}
