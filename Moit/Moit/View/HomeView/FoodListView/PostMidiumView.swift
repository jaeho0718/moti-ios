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
        HStack(alignment:.top , spacing:8){
            AsyncImageView(url: loadRestaurantImage(), placeholder: {
                Rectangle()
            },image: { uiimage in
                Image(uiImage: uiimage).resizable()
            }).aspectRatio(contentMode: .fill)
            .frame(width: 84, height: 87, alignment: .center).clipped()
            
            VStack(alignment:.leading,spacing : 0){
                Text(post.title).font(.custom("DoHyeon-Regular", size: 16))
                Text(post.title).font(.custom("DoHyeon-Regular", size: 12))
                    .foregroundColor(Color("SecondaryTextColor")).padding(.top,3)
                Text("\(2)/\(post.max_participants)명")
                    .font(.custom("DoHyeon-Regular", size: 12))
                        .foregroundColor(Color("SecondaryTextColor")).padding(.top,7)
                Text("필요금액 : \(post.delivery_fee)원")
                    .font(.custom("DoHyeon-Regular", size: 12))
                    .foregroundColor(Color("SecondaryTextColor")).padding(.top,2)
            }
            .frame(maxWidth:.infinity, alignment: .leading)
            .padding(.top,5)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(radius: 1,x: 1,y: 1)
    }
    
    private func loadRestaurantImage() -> URL {
        return URL(string: "https://cdn.dominos.co.kr/admin/upload/goods/20210603_0a73o5Q1.jpg?RS=350x350&SP=1")!
    }
}

struct PostMidiumView_Previews: PreviewProvider {
    static var previews: some View {
        PostMidiumView(post: .init(id: 1, writer_id: 1, title: "도미노피자 여의도점"
                                   ,content: "", location_id: 10, max_participants: 3
                                   , price: 10, delivery_fee: 8143))
    }
}
