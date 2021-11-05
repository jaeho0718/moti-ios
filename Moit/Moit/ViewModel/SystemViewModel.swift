//
//  SystemViewModel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import Foundation
import SwiftUI

class SystemViewModel : ObservableObject{
    @Published var tabitem : TabItems = .home
    
    enum TabItems : Identifiable,CaseIterable{
        case home,search,moit,noti,account
        var id : Int{
            switch self {
            case .home:
                return 0
            case .search:
                return 1
            case .moit:
                return 2
            case .noti:
                return 3
            case .account:
                return 4
            }
        }
        var icon : String{
            switch self {
            case .home:
                return "house.fill"
            case .search:
                return "magnifyingglass"
            case .moit:
                return "plus"
            case .noti:
                return "bell.fill"
            case .account:
                return "person.crop.circle.fill"
            }
        }
        var title : LocalizedStringKey{
            switch self {
            case .home:
                return "홈"
            case .search:
                return "검색"
            case .moit:
                return "추가하기"
            case .noti:
                return "알림"
            case .account:
                return "계정"
            }
        }
    }
}
