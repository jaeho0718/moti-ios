//
//  DataViewModel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import Foundation
import Alamofire

class DataViewModel : ObservableObject {
    @Published var Posts : [Post] = [ .init(id: 0, writer_id: 0, title: "교촌 치킨"
                                                  ,content: "", location_id: 0,
                                                  max_participants: 10, price: 10, delivery_fee: 10)
                                            ,.init(id: 1, writer_id: 0, title: "교촌 치킨"
                                                   ,content: "", location_id: 0,
                                                   max_participants: 10, price: 10, delivery_fee: 10)
                                            ,.init(id: 2, writer_id: 0, title: "교촌 치킨"
                                                   ,content: "", location_id: 0,
                                                   max_participants: 10, price: 10, delivery_fee: 10)
                                            ,.init(id: 3, writer_id: 0, title: "교촌 치킨"
                                                   ,content: "", location_id: 0,
                                                max_participants: 10, price: 10, delivery_fee: 10)
                                            ,.init(id: 4, writer_id: 0, title: "교촌 치킨"
                                                   ,content: "", location_id: 0,
                                                   max_participants: 10, price: 10, delivery_fee: 10)
                                            ,.init(id: 5, writer_id: 0, title: "교촌 치킨"
                                                   ,content: "", location_id: 0,
                                                   max_participants: 10, price: 10, delivery_fee: 10)
                                            ,.init(id: 6, writer_id: 0, title: "교촌 치킨"
                                                   ,content: "", location_id: 0,
                                                   max_participants: 10, price: 10, delivery_fee: 10)
                                            ,.init(id: 7, writer_id: 0, title: "교촌 치킨"
                                                   ,content: "", location_id: 0,
                                                   max_participants: 10, price: 10, delivery_fee: 10)
                                          ]
    @Published var usageItems : [Usage] = [
        .init(id: 0, date: Date(), point: 7300, restraunt: "교촌치킨 중앙대후문점")
        ,.init(id: 1, date: Date(), point: 7300, restraunt: "교촌치킨 중앙대후문점")
        ,.init(id: 2, date: Date(), point: 7300, restraunt: "교촌치킨 중앙대후문점")
        ,.init(id: 3, date: Date(), point: 7300, restraunt: "교촌치킨 중앙대후문점")
        ,.init(id: 4, date: Date(), point: 7300, restraunt: "교촌치킨 중앙대후문점")
    ]
    
    @Published var restaurent : [Restaurant] = []
    
    /// 이름을 통해 음식점을 검색합니다.
    func searchRestaurant(text : String, completion : @escaping (Result<[Restaurant],Error>) -> Void){
        let url = ""
        KeyChainModel.shared.readValue(completion: { response in
            switch response {
            case .success(let token):
                let authHeader : HTTPHeader = .init(name: "Authorization", value: "Bearer \(token.accessToken)")
                AF.request(url, method: .get, parameters: ["searchKey":text], headers: [authHeader])
                    .responseData(completionHandler: { responseData in
                        switch responseData.result {
                        case .success(let data):
                            do{
                                let results = try JSONDecoder().decode([String:[Restaurant]].self
                                                                       , from: data)
                                if let result = results["restaurants"] {
                                    completion(.success(result))
                                } else {
                                    completion(.failure(DataError.noData))
                                }
                            } catch let error {
                                completion(.failure(error))
                            }
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    })
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    /// 레스토랑 정보를 불러옵니다. 이 정보는  restaurent 변수에 저장됩니다.
    func loadRestaurent(load : DataLoadType = .cache) {
        if let url = URL(string: "") {
            var request = URLRequest(url: url)
            if load == .cache {
                request.cachePolicy = .returnCacheDataElseLoad
            }
            KeyChainModel.shared.readValue(completion: { response in
                switch response {
                case .success(let accessToken) :
                    request.httpMethod = "GET"
                    request.addValue("Authorization",
                                     forHTTPHeaderField: "Bearer \(accessToken.accessToken)")
                    URLSession.shared.dataTask(with: request, completionHandler: {
                        taskData,taskResponse,error in
                        if let taskData = taskData {
                            do {
                                self.restaurent = try JSONDecoder().decode([Restaurant].self,
                                                                           from: taskData)
                            } catch let error {
                                print("Restaurant decode error : \(error.localizedDescription)")
                            }
                        }
                    })
                case .failure(let error) :
                    print("KeychainLoad error : \(error.localizedDescription)")
                }
            })
        } else {
            
        }
    }
    
    /// 주어진 레스토랑과 관련된 메뉴 나열, 시작할 때 호출하기
    func loadRestaurantMenu(id : Int, completion : @escaping (Result<[MenuData],Error>) -> Void) {
        let url = ""
        //AF.request(url, method: .get, parameters: <#T##Encodable?#>, encoder: <#T##ParameterEncoder#>, headers: <#T##HTTPHeaders?#>, interceptor: <#T##RequestInterceptor?#>, requestModifier: <#T##Session.RequestModifier?##Session.RequestModifier?##(inout URLRequest) throws -> Void#>)
        completion(.success([
            .init(id: "0", restaurant_id: 0, title: "교촌신화오리지날", price: 18000, image_id: 0, isSelected: false)
            ,.init(id:"1", restaurant_id: 0, title: "교촌오리지날", price: 18000, image_id: 0, isSelected: false)
            ,.init(id: "2", restaurant_id: 0, title: "교촌허니오리지날", price: 18000, image_id: 0, isSelected: false)
            ,.init(id: "3", restaurant_id: 0, title: "교촌신화오리지날", price: 18000, image_id: 0, isSelected: false)
        ]))
    }
    
    func createPost() {
        
    }
    
    func loadPost() {
        
    }
    
    //대학정보를 불러옵니다.
    func loadUniversityList(completion : @escaping (Result<[UniversityModel],Error>) -> Void ) {
        if let url = URL(string: "http://moit-server-prod.eba-eecfjwgm.ap-northeast-2.elasticbeanstalk.com/api/v1/university") {
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request, completionHandler: {
                data,response,error in
                if let error = error {
                    print("Create user error : \(error.localizedDescription)")
                }
                if let httpResponse = response as? HTTPURLResponse
                    , 200 ... 399 ~= httpResponse.statusCode{
                    if let data = data {
                        do {
                            let results = try JSONDecoder().decode([String:[UniversityModel]].self, from: data)
                            if let list = results["universities"] {
                                completion(.success(list))
                            } else {
                                completion(.failure(DataError.noData))
                            }
                        } catch let error {
                            completion(.failure(error))
                        }
                    } else {
                        completion(.failure(DataError.noData))
                    }
                } else {
                    completion(.failure(DataError.loginError))
                }
            }).resume()
        } else {
            completion(.failure(DataError.notValidateUrl))
        }
    }
}
