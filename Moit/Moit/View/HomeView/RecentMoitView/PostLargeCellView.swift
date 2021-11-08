//
//  PostLargeCellView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct PostLargeCellView: View {
    @Environment(\.postType) var postType
    @EnvironmentObject var dataViewmodel : DataViewModel
    
    var post : Post
    
    var body: some View {
        NavigationLink(destination:{
            PostDetailView(post: post).environmentObject(dataViewmodel)
        }){
            HStack{
                Group{
                    if let url = URL(string: post.thumbnailImageKey) {
                        AsyncImageView(url: url , placeholder: {
                            Rectangle()
                        },image: { uiimage in
                            Image(uiImage: uiimage).resizable()
                        }).aspectRatio(contentMode: .fill)
                    } else {
                        Rectangle()
                    }
                }.frame(width: postType == .share ? 112 : 86,
                        height: postType == .share ? 112 : 86,
                        alignment: .center).clipped()
                
                VStack(alignment:.leading,spacing : 0){
                    /*
                     Text(post.title).font(.custom("DoHyeon-Regular", size: 17))
                         .foregroundColor(.black)
                     가게 이름으로 바꾸기
                     */
                    Text("Title").font(.custom("DoHyeon-Regular", size: 17))
                        .foregroundColor(.black)
                    Spacer()
                    if postType == .share {
                        Text("소분 용기 : 가게 요청")
                            .font(.custom("DoHyeon-Regular", size: 12))
                                .foregroundColor(Color("SecondaryTextColor"))
                        Text("남은 인원 : \(post.maxParticipants-post.nowParticipants)명")
                            .font(.custom("DoHyeon-Regular", size: 12))
                                .foregroundColor(Color("SecondaryTextColor")).padding(.top,2)
                    }
                    Text("필요 금액 : \(post.totalPrice)원")
                        .font(.custom("DoHyeon-Regular", size: 12))
                        .foregroundColor(Color("SecondaryTextColor")).padding(.top,2)
                    
                    if postType == .together {
                        Text("개인별 배달팁 : \(post.totalPrice/post.maxParticipants)원")
                            .font(.custom("DoHyeon-Regular", size: 12))
                            .foregroundColor(Color("SecondaryTextColor")).padding(.top,2)
                    }
                }
                .padding(.bottom,6)
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.top,5)
                
            }
        }.frame(height: postType == .share ? 112 : 86)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 1,x: 1,y: 1)
    }
}


 struct PostLargeCellView_Previews: PreviewProvider {
     static var previews: some View {
         PostLargeCellView(post: .init(id: 0, restaurantId: 0
                                       , thumbnailImageKey: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201707/19/80af45c3-e5d6-4774-9916-974d5c7e0275.gif"
                                       , creatorId: 0, message: "맛있게 부탁드려요"
                                       , maxParticipants: 10, nowParticipants: 3
                                       , totalPrice: 21000, createdAt: ""
                                       , updatedAt: ""))
     }
 }

struct PostTypeEnvironment : EnvironmentKey {
    static let defaultValue : RecentMoitView.TabType = .share
}

extension EnvironmentValues {
    var postType : RecentMoitView.TabType {
        get { self[PostTypeEnvironment.self] }
        set { self[PostTypeEnvironment.self] = newValue }
    }
}
