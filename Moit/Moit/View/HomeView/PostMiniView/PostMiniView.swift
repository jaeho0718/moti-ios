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
                    if let url = URL(string: post.thumnailImageKey) {
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

/*
 
 struct PostMiniView_Previews: PreviewProvider {
     static var previews: some View {
         PostMiniView(post: .init(id: 1, writer_id: 1, title: "교촌치킨"
         , content: "", location_id: 10, max_participants: 10, price: 10, delivery_fee: 10))
             .environmentObject(DataViewModel())
     }
 }
 */
