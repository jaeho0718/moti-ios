//
//  SectionView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct SectionView<Destination : View> : View {
    
    @Binding var posts : [Post]
    var title : LocalizedStringKey
    var destination : () -> Destination
    
    init(title : LocalizedStringKey, posts : Binding<[Post]>
        ,@ViewBuilder destination : @escaping () -> Destination) {
        self.title = title
        self._posts = posts
        self.destination = destination
    }
    
    var body: some View {
        VStack(spacing:0){
            NavigationLink(destination:destination){
                HStack{
                    Text(title).font(.custom("DoHyeon-Regular", size: 18))
                        .foregroundColor(Color("SectionTextColor"))
                    Spacer(minLength: 0)
                    Image(systemName: "chevron.compact.right")
                        .foregroundColor(Color("SecondaryTextColor"))
                }.padding(.horizontal,18)
                .padding(.vertical,5)
            }
            ScrollViewReader{ proxy in
                ScrollView(.horizontal, showsIndicators: false){
                    if posts.filter({$0.maxParticipants > $0.nowParticipants}).isEmpty {
                        Text("주문이 없어요.").font(.custom("DoHyeon-Regular", size: 15))
                            .padding(18)
                    }
                    LazyHStack{
                        ForEach(posts.filter({$0.maxParticipants > $0.nowParticipants})){ post in
                            PostMiniView(post: post).id(post.id)
                                .padding(.leading, posts.first?.id == post.id ? 18 : 0)
                                .padding(.trailing, posts.last?.id == post.id ? 18 : 0)
                        }
                    }
                }
                .onAppear{
                    if let firstId = posts.first?.id{
                        proxy.scrollTo(firstId, anchor: .leading)
                    }
                }
            }.frame(height : 139)
        }.frame(maxWidth:.infinity,alignment:.leading)
        .accentColor(.primary)
        .padding(.vertical,5)
        .background(Color.white)
    }
}


 struct SectionView_Previews: PreviewProvider {
     static var previews: some View {
         NavigationView{
             SectionView(title: "Test", posts: .constant([
                .init(id: 0, restaurantId: 0
                    , thumbnailImageKey: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201707/19/80af45c3-e5d6-4774-9916-974d5c7e0275.gif"
                    , creatorId: 0, message: "맛있게 부탁드려요"
                    , maxParticipants: 10, nowParticipants: 3
                    , totalPrice: 21000, createdAt: ""
                    , updatedAt: "")
                ,.init(id: 0, restaurantId: 0
                       , thumbnailImageKey: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201707/19/80af45c3-e5d6-4774-9916-974d5c7e0275.gif"
                       , creatorId: 0, message: "맛있게 부탁드려요"
                       , maxParticipants: 10, nowParticipants: 3
                       , totalPrice: 21000, createdAt: ""
                       , updatedAt: "")
                ,.init(id: 0, restaurantId: 0
                       , thumbnailImageKey: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201707/19/80af45c3-e5d6-4774-9916-974d5c7e0275.gif"
                       , creatorId: 0, message: "맛있게 부탁드려요"
                       , maxParticipants: 10, nowParticipants: 3
                       , totalPrice: 21000, createdAt: ""
                       , updatedAt: "")
                ,.init(id: 0, restaurantId: 0
                       , thumbnailImageKey: "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201707/19/80af45c3-e5d6-4774-9916-974d5c7e0275.gif"
                       , creatorId: 0, message: "맛있게 부탁드려요"
                       , maxParticipants: 10, nowParticipants: 3
                       , totalPrice: 21000, createdAt: ""
                       , updatedAt: "")
             ])){
                 Text("test")
             }
         }.navigationViewStyle(.stack)
     }
 }
 
