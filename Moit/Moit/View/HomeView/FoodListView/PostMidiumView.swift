//
//  PostMidiumView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct PostMidiumView: View {
    @EnvironmentObject var dataViewmodel : DataViewModel
    var post : Post
    
    var body: some View {
        NavigationLink(destination:{
            PostDetailView(post: post).environmentObject(dataViewmodel)
        }){
            HStack(alignment:.top , spacing:8){
                Group{
                    if let url = URL(string: post.thumbnailImageKey) {
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
                    Text("Title").font(.custom("DoHyeon-Regular", size: 16))
                            .foregroundColor(.black)
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


 struct PostMidiumView_Previews: PreviewProvider {
     static var previews: some View {
         PostMidiumView(post: .init(id: 0, restaurantId: 0
                                    , thumbnailImageKey: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201707/19/80af45c3-e5d6-4774-9916-974d5c7e0275.gif"
                                    , creatorId: 0, message: "맛있게 부탁드려요"
                                    , maxParticipants: 10, nowParticipants: 3
                                    , totalPrice: 21000, createdAt: ""
                                    , updatedAt: ""))
     }
 }
 
