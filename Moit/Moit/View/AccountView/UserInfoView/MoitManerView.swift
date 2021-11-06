//
//  MoitManerView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct MoitManerView: View {
    var score : Double
    
    var body: some View {
        HStack{
            VStack(alignment:.trailing){
                Text(String(format:"%.1f",score))
                    .font(.custom("DoHyeon-Regular",size:20))
                    .foregroundColor(textColor())
                Text("오잇 매너")
                    .font(.custom("DoHyeon-Regular",size:10))
            }
            Group{
                if score >= 4.0 {
                    Text("🌝")
                } else if score > 3.0 {
                    Text("🌕")
                } else if score > 2.0 {
                    Text("🌓")
                } else if score > 1.0 {
                    Text("🌒")
                } else {
                    Text("🌑")
                }
            }.font(.system(size:30))
        }
    }
    
    private func textColor() -> Color {
        if score >= 4.0 {
            return .green
        } else if score > 3.0 {
            return .blue
        } else if score > 2.0 {
            return .yellow
        } else if score > 1.0 {
            return .orange
        } else {
            return .red
        }
    }
}

struct MoitManerView_Previews: PreviewProvider {
    static var previews: some View {
        MoitManerView(score: 1.50)
    }
}
