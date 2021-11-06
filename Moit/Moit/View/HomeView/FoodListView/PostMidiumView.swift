//
//  PostMidiumView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct PostMidiumView: View {
    
    var post : Post
    
    var body: some View {
        NavigationLink(destination:{
            PostDetailView(post: post)
        }){
            HStack(alignment:.top , spacing:8){
                Group{
                    if let url = URL(string: post.thumnailImageKey) {
                        AsyncImageView(url: url, placeholder: {
                            Rectangle()
                        },image: { uiimage in
                            Image(uiImage: uiimage).resizable()
                        }).aspectRatio(contentMode: .fill)
                    } else {
                        Rectangle()
                    }
                }.frame(width: 84, height: 87, alignment: .center).clipped()
                
                VStack(alignment:.leading,spacing : 0){
                    /*
                     Text(post.title).font(.custom("DoHyeon-Regular", size: 16))
                         .foregroundColor(.black)
                     Text(post.content).font(.custom("DoHyeon-Regular", size: 12))
                         .foregroundColor(Color("SecondaryTextColor")).padding(.top,3)
                     가게 이름으로 바꾸기
                     */
                    Spacer()
                    Text("\(post.nowParticipants)/\(post.maxParticipants)명")
                        .font(.custom("DoHyeon-Regular", size: 12))
                            .foregroundColor(Color("SecondaryTextColor")).padding(.top,7)
                    Text("필요금액 : \(post.totalPrice)원")
                        .font(.custom("DoHyeon-Regular", size: 12))
                        .foregroundColor(Color("SecondaryTextColor")).padding(.top,2)
                        .padding(.bottom,6)
                }
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.top,5)
            }
        }
        .frame(height:87)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(radius: 1,x: 1,y: 1)
    }
    
}

/*
 struct PostMidiumView_Previews: PreviewProvider {
     static var previews: some View {
         PostMidiumView(post: .init(id: 1, writer_id: 1, title: "도미노피자 여의도점"
                                    ,content: "치즈 퐁듀", location_id: 10, max_participants: 3
                                    , price: 10, delivery_fee: 8143))
     }
 }
 */
