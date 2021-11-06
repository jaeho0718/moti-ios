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
                    LazyHStack{
                        ForEach(posts){ post in
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

/*
 struct SectionView_Previews: PreviewProvider {
     static var previews: some View {
         NavigationView{
             SectionView(title: "Test", posts: .constant([
                 .init(id: 0, writer_id: 0, title: "교촌치킨", content: "", location_id: 0
                     ,max_participants: 10, price: 0, delivery_fee: 0),
                 .init(id: 1, writer_id: 0, title: "교촌치킨", content: "", location_id: 0
                     ,max_participants: 10, price: 0, delivery_fee: 0),
                 .init(id: 2, writer_id: 0, title: "교촌치킨", content: "", location_id: 0
                     ,max_participants: 10, price: 0, delivery_fee: 0),
                 .init(id: 3, writer_id: 0, title: "교촌치킨", content: "", location_id: 0
                     ,max_participants: 10, price: 0, delivery_fee: 0)
             ])){
                 Text("test")
             }
         }.navigationViewStyle(.stack)
     }
 }
 */
