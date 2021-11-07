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
    func postOrder(id : Int,completion : @escaping (Result<Bool,Error>) -> Void){
        if let url = URL(string:
        "http://moit-server-prod.eba-eecfjwgm.ap-northeast-2.elasticbeanstalk.com/api/v1/order") {
            var menudata : [OrderModel.MenuProperty] = []
            for menu in menus.filter({$0.isSelected}) {
                menudata.append(.init(menuId: menu.id, count: 1))
            }
            let body = OrderModel(restaurantId: id, menus: menudata
                                  , message: request, maxParticipants: count)
            KeyChainModel.shared.readValue(completion: { response in
                switch response {
                case .success(let token):
                    var request = URLRequest(url: url)
                    request.addValue("Bearer \(token.accessToken)", forHTTPHeaderField: "Authorization")
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.httpMethod = "POST"
                    do {
                        let body_data = try JSONEncoder().encode(body)
                        request.httpBody = body_data
                        URLSession.shared.dataTask(with: request, completionHandler: {
                            taskData,taskResponse,error in
                            if let taskData = taskData {
                                print("Order : \(String(data: taskData, encoding: .utf8))")
                            }
                            if let taskResponse = taskResponse as? HTTPURLResponse,
                               201 == taskResponse.statusCode {
                                completion(.success(true))
                            } else {
                                completion(.failure(DataError.noData))
                            }
                        }).resume()
                    } catch let error {
                        completion(.failure(error))
                    }
                   
                case .failure(let error):
                    completion(.failure(error))
                }
            })
        } else {
            completion(.failure(DataError.notValidateUrl))
        }
    }
    
    ///Menu 구조체를 생성합니다.
    func generageMenus(restaurent : Restaurant){
        menus = restaurent.menus
    }
}
