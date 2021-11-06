//
//  OrderViewModel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import Foundation
import Alamofire

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
    
    ///Order를 넣습니다.
    func postOrder(completion : @escaping (Result<Bool,Error>) -> Void){
        let url = URL(string: "")!
        var dictionaryMenu : [[String:Int]] = []
        for menu in menus {
            dictionaryMenu.append([menu.id:1])
        }
        var body = OrderModel(restaurantId: 0, menus: dictionaryMenu, message: request, maxParticipants: count)
        KeyChainModel.shared.readValue(completion: { response in
            switch response {
            case .success(let token):
                var request = URLRequest(url: url)
                request.addValue( "Authorization", forHTTPHeaderField: "Bearer \(token.accessToken)")
                do {
                    let body_data = try JSONEncoder().encode(body)
                    request.httpBody = body_data
                    URLSession.shared.dataTask(with: request, completionHandler: {
                        taskData,taskResponse,error in
                        if let taskResponse = taskResponse {
                            
                        }
                    })
                } catch let error {
                    completion(.failure(error))
                }
               
            case .failure(let error):
                completion(.failure(error))
            }
        })
        
    }
    
    ///Menu 구조체를 생성합니다.
    func generageMenus(restaurent : Restaurant){
        /*
         for menu in restaurent.menus {
             menus.append(.init(id: <#T##String#>, restaurant_id: restaurent.id, title: <#T##String#>, price: <#T##Int#>, image_id: <#T##Int#>, isSelected: <#T##Bool#>))
         }
         */
    }
}
