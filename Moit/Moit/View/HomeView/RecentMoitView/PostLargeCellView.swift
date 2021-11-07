//
//  PostLargeCellView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct PostLargeCellView: View {
    @Environment(\.postType) var postType
    
    var post : Post
    
    var body: some View {
        NavigationLink(destination:{
            PostDetailView(post: post)
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

/*
 struct PostLargeCellView_Previews: PreviewProvider {
     static var previews: some View {
         PostLargeCellView(post: .init(id: 1, writer_id: 1, title: "교촌치킨"
             ,content: "", location_id: 10, max_participants: 10, price: 10, delivery_fee: 10))
     }
 }

 */
struct PostTypeEnvironment : EnvironmentKey {
    static let defaultValue : RecentMoitView.TabType = .share
}

extension EnvironmentValues {
    var postType : RecentMoitView.TabType {
        get { self[PostTypeEnvironment.self] }
        set { self[PostTypeEnvironment.self] = newValue }
    }
}
