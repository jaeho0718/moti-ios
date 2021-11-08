//
//  PostMiniView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct PostMiniView: View {
    @EnvironmentObject var dataViewmodel : DataViewModel
    
    var post : Post
    
    var body: some View {
        NavigationLink(destination:{
            PostDetailView(post: post).environmentObject(dataViewmodel)
        }){
            VStack(alignment : .leading,spacing: 5){
                Group {
                    if let url = URL(string: post.thumbnailImageKey) {
                        AsyncImageView(url: url, placeholder: {
                            RoundedRectangle(cornerRadius: 6)
                        },image: { uiimage in
                            Image(uiImage: uiimage).resizable()
                        }).aspectRatio(contentMode: .fill)
                    } else {
                        RoundedRectangle(cornerRadius: 6)
                    }
                }
                .frame(width: 80, height: 80, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                VStack(alignment : .leading, spacing : 0){
                    /*
                     Text(post.title)
                         .foregroundColor(.black)
                         .font(.system(size: 13, weight: .semibold, design: .default))
                     //가게 이름으로 바꾸기
                     */
                    Group{
                        Text("허니콤보").font(.system(size: 12, weight: .medium, design: .default))
                        Text("\(post.nowParticipants)/\(post.maxParticipants)명").font(.system(size: 10, weight: .medium, design: .default))
                    }.foregroundColor(Color("SecondaryTextColor"))
                }
            }
        }
    }
}


 
 struct PostMiniView_Previews: PreviewProvider {
     static var previews: some View {
         PostMiniView(post: .init(id: 0, restaurantId: 0
                                  , thumbnailImageKey: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201707/19/80af45c3-e5d6-4774-9916-974d5c7e0275.gif"
                                  , creatorId: 0, message: "맛있게 부탁드려요"
                                  , maxParticipants: 10, nowParticipants: 3
                                  , totalPrice: 21000, createdAt: ""
                                  , updatedAt: ""))
             .environmentObject(DataViewModel())
     }
 }

