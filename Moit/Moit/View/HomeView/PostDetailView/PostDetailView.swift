//
//  PostDetailView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct PostDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var dataViewmodel : DataViewModel
    
    @State private var check : Bool = false
    @State private var done : Bool = false
    
    enum ShowType {
        case latest,deadline
    }
    
    var post : Post
    
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
            }.padding(.vertical,5)
            .padding(.horizontal)
            ScrollView(.vertical,showsIndicators: false){
                Group{
                    if let url = URL(string: post.thumbnailImageKey) {
                        AsyncImageView(url: url, placeholder: {
                            Rectangle()
                        },image: { uiimage in
                            Image(uiImage: uiimage).resizable()
                        }).aspectRatio(3/2,contentMode: .fill)
                    } else {
                        Rectangle().frame(height:250)
                    }
                }.clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.top,10)
                
                VStack(alignment:.leading,spacing:3){
                    Text("주문자 : 주문자 별명")
                        .font(.custom("DoHyeon-Regular", size: 12))
                            .foregroundColor(Color("SecondaryTextColor"))
                    Group{
                        Text("모잇 매너 :").foregroundColor(Color("SecondaryTextColor"))
                        + Text(" \(4)").foregroundColor(.green)
                    }.font(.custom("DoHyeon-Regular", size: 12))
                }.padding(.top,9).frame(maxWidth:.infinity,alignment: .leading)
                
                Divider()
                
                /*
                 HStack(alignment:.bottom){
                     Text(post.title)
                         .font(.custom("DoHyeon-Regular", size: 24))
                         .foregroundColor(.black)
                     Spacer()
                     Text("배달팁 : \(post.delivery_fee)")
                         .font(.custom("DoHyeon-Regular", size: 14))
                         .foregroundColor(Color("SecondaryTextColor"))
                 }//가게 정보 이용해서 수정하기
                 */
                
                DetailLabel(icon: "arrowtriangle.right.fill", title: "주문 메뉴 : 치즈 퐁듀 파이어미트"){}
                .padding(.top,18)
                
                DetailLabel(icon: "location.north.fill", title: "배달 도착지 : 주문자 주소"){}
                .padding(.top,18)
                
                DetailLabel(icon: "dollarsign.circle.fill", title: "개인 지불 포인트 : \(post.totalPrice/post.maxParticipants)원"){}
                .padding(.top,18)
                
                DetailLabel(icon: "bag.fill", title: "소분 용기를 각자 준비해주세요!"){}
                .padding(.top,18)
                
                DetailLabel(icon: "person.fill", title: "참여 현황 : \(post.nowParticipants)/\(post.maxParticipants)"){
                    ProgressView(value: Double(post.nowParticipants)/Double(post.maxParticipants))
                }
                .padding(.top,18)
                
                DetailLabel(icon: "bubble.right.fill", title: "요청사항"){
                    Text(post.message)
                        .font(.custom("DoHyeon-Regular", size: 14))
                        .foregroundColor(Color("SecondaryTextColor"))
                }
                .padding(.top,18)
                .padding(.bottom,10)
                
            }.padding(.horizontal,18)
                .navigationTitle("").navigationBarHidden(true)
            Button(action:{
                check.toggle()
            }){
                Text("참여")
                    .font(.custom("DoHyeon-Regular", size: 20))
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity,minHeight:45)
            }.background(Color("AccentButtonColor").ignoresSafeArea())
        }
        .background(Color.white.ignoresSafeArea())
        .overlay(DoneView(done: $done))
        .customAlert(show: $check){
            CustomNotiView(check: $check, title: "확인 부탁드립니다.",
                           content: "\(8143) 포인트가 차감되며 주문 실패시 고객님의 계정으로 반환합니다.",
                           cancleTitle: "취소", confirmTitle: "확인",
                           cancelAction: {}, confirmAction: {
                dataViewmodel.joinPost(id: post.id, completion: { response in
                    switch response {
                    case .success(_) :
                        done.toggle()
                    case .failure(let error) :
                        print("Join Error : \(error.localizedDescription)")
                    }
                })
            })
            //마지막 참가자 확인 기능 넣을 것
        }
    }
}

/*
 struct PostDetailView_Previews: PreviewProvider {
     static var previews: some View {
         PostDetailView(post: .init(id: 1, writer_id: 1, title: "교촌치킨"
                                    ,content: "", location_id: 10
                                    ,max_participants: 10, price: 10, delivery_fee: 10))
     }
 }

 */
