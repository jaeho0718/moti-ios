//
//  OrderViewModel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import Foundation

class OrderViewModel : ObservableObject {
    @Published var type : OrderType = .share
    @Published var restraunt : Restaurant?
    @Published var menus : [MenuData] = []
    @Published var count : Int = 5
    @Published var request : String = ""
    @Published var needBowl : Bool = false
    
    func totalPrice() -> Int {
        return menus.filter({$0.isSelected}).map({$0.price})
            .reduce(0) { (a : Int, b : Int) -> Int in
                return a + b
            }
    }
}
