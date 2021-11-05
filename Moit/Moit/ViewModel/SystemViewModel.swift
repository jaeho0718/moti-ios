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
        case home,search,point,noti,account
        var id : Int{
            switch self {
            case .home:
                return 0
            case .search:
                return 1
            case .point:
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
            case .point:
                return "p.circle.fill"
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
            case .point:
                return "포인트"
            case .noti:
                return "알림"
            case .account:
                return "계정"
            }
        }
    }
}
