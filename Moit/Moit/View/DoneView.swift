//
//  DoneView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct DoneView: View {
    @Binding var done : Bool
    @State private var animation : Bool = false
    
    var body: some View {
        ZStack{
            if done {
                Rectangle().foregroundColor(Color("AccentButtonColor")).ignoresSafeArea()
                VStack{
                    Image(systemName: "checkmark.circle.fill")
                        .resizable().aspectRatio(contentMode: .fit)
                        .frame(width:29,height:29).foregroundColor(.white)
                    Text("등록이 완료되었습니다.")
                        .font(.custom("DoHyeon-Regular", size: 28))
                        .foregroundColor(.white).padding(.top,26)
                }.scaleEffect(animation ? 1 : 0.2)
            }
        }
        .onChange(of: done, perform: { value in
            if value {
                withAnimation(.spring()){
                    animation.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                    withAnimation(.easeInOut){
                        done = false
                    }
                })
            }
        })
    }
}

struct DoneView_Previews: PreviewProvider {
    static var previews: some View {
        DoneView(done: .constant(true))
    }
}
