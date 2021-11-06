//
//  MotiTypeSelectionView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct MotiTypeSelectionView: View {
    @EnvironmentObject var order : OrderViewModel
    @Binding var show : Bool
    
    var body: some View {
        ZStack(alignment:.bottom){
            if show {
                Rectangle().opacity(0.2).ignoresSafeArea()
                
                VStack{
                    ForEach(OrderType.allCases){ type in
                        Button(action:{
                            order.type = type
                            show = false
                        }){
                            Text(type.title).frame(width:326,height:48)
                                .font(.custom("DoHyeon-Regular", size: 20))
                        }
                        .background(RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(.white).shadow(radius: 2))
                    }
                }.padding(.bottom)
            }
        }
    }
}

struct MotiTypeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MotiTypeSelectionView(show: .constant(true))
            .environmentObject(OrderViewModel())
    }
}
