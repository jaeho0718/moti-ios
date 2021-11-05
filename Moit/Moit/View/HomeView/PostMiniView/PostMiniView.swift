//
//  PostMiniView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

struct PostMiniView: View {
    
    var post : Post
    
    var body: some View {
        VStack(alignment : .leading,spacing: 5){
            AsyncImageView(url: loadRestaurantImage(), placeholder: {
                RoundedRectangle(cornerRadius: 6)
            },image: { uiimage in
                Image(uiImage: uiimage).resizable()
            }).aspectRatio(contentMode: .fill).frame(width: 80, height: 80, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            VStack(alignment : .leading, spacing : 0){
                Text(post.title)
                    .foregroundColor(.primary)
                    .font(.system(size: 13, weight: .semibold, design: .default))
                Group{
                    Text("허니콤보").font(.system(size: 12, weight: .medium, design: .default))
                    Text("1/2명").font(.system(size: 10, weight: .medium, design: .default))
                }.foregroundColor(.secondary)
            }
        }
    }
    
    //수정하기
    private func loadRestaurantImage() -> URL {
        return URL(string: "https://img.hankyung.com/photo/202102/02.24168127.1.jpg")!
    }
}

struct PostMiniView_Previews: PreviewProvider {
    static var previews: some View {
        PostMiniView(post: .init(id: 1, writer_id: 1, title: "교촌치킨"
        , content: "", location_id: 10, max_participants: 10, price: 10, delivery_fee: 10))
    }
}
