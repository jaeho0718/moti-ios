//
//  DataViewModel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import Foundation
import Alamofire

@MainActor
class DataViewModel : ObservableObject {
    @Published var latestPost : [Post] = []
    @Published var deadlinePost : [Post] = []
    @Published var categories : [Category] = []
    @Published var usageItems : [Usage] = [
        .init(id: 0, date: Date(), point: 7300, restraunt: "교촌치킨 중앙대후문점")
        ,.init(id: 1, date: Date(), point: 7300, restraunt: "교촌치킨 중앙대후문점")
        ,.init(id: 2, date: Date(), point: 7300, restraunt: "교촌치킨 중앙대후문점")
        ,.init(id: 3, date: Date(), point: 7300, restraunt: "교촌치킨 중앙대후문점")
        ,.init(id: 4, date: Date(), point: 7300, restraunt: "교촌치킨 중앙대후문점")
    ]
    @Published var categoryPosts : [Int : [Post]] = [:]
    
    var university : [UniversityModel] = []
    
    /// 이름을 통해 음식점을 검색합니다.
    func searchRestaurant(text : String, completion : @escaping (Result<[Restaurant],Error>) -> Void){
        let url = "http://moit-server-prod.eba-eecfjwgm.ap-northeast-2.elasticbeanstalk.com/api/v1/restaurant"
        KeyChainModel.shared.readValue(completion: { response in
            switch response {
            case .success(let token):
                let authHeader : HTTPHeader = .init(name: "Authorization", value: "Bearer \(token.accessToken)")
                AF.request(url, method: .get, parameters: ["searchKey":text], headers: [authHeader])
                    .responseData(completionHandler: { responseData in
                        switch responseData.result {
                        case .success(let data):
                            do{
                                print(String(data: data, encoding: .utf8))
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
    
    /// 최근의 포스트를 불러옵니다.
    func loadLatestPost() {
        let url = "http://moit-server-prod.eba-eecfjwgm.ap-northeast-2.elasticbeanstalk.com/api/v1/order"
        KeyChainModel.shared.readValue(completion: { response in
            switch response {
            case .success(let token):
                let authHeader : HTTPHeader = .init(name: "Authorization", value: "Bearer \(token.accessToken)")
                AF.request(url, method: .get, parameters: ["sortBy":"latest","searchKey":""], headers: [authHeader])
                    .responseData(completionHandler: { responseData in
                        switch responseData.result {
                        case .success(let data):
                            do{
                                print("Post data : \(String(data: data, encoding: .utf8))")
                                let results = try JSONDecoder().decode([String:[Post]].self
                                                                       , from: data)
                                if let result = results["orders"] {
                                    self.latestPost = result
                                    print("Latest : \(result)")
                                }
                            } catch let error {
                                print(error.localizedDescription)
                            }
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    })
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func loadCategoryPost(categoryId : Int) {
        let url = "http://moit-server-prod.eba-eecfjwgm.ap-northeast-2.elasticbeanstalk.com/api/v1/order"
        KeyChainModel.shared.readValue(completion: { response in
            switch response {
            case .success(let token):
                let authHeader : HTTPHeader = .init(name: "Authorization", value: "Bearer \(token.accessToken)")
                AF.request(url, method: .get, parameters: ["categoryId":categoryId,"searchKey":""], headers: [authHeader])
                    .responseData(completionHandler: { responseData in
                        switch responseData.result {
                        case .success(let data):
                            do{
                                let results = try JSONDecoder().decode([String:[Post]].self
                                                                       , from: data)
                                if let result = results["orders"] {
                                    self.categoryPosts[categoryId] = result
                                }
                            } catch let error {
                                print(error.localizedDescription)
                            }
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    })
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    ///Post에 Join합니다.
    func joinPost(id : Int, completion : @escaping (Result<Bool,Error>) -> Void ) {
        let url_str = "http://moit-server-prod.eba-eecfjwgm.ap-northeast-2.elasticbeanstalk.com/api/v1/order/\(id)/join"
        if let url = URL(string: url_str) {
            KeyChainModel.shared.readValue(completion: { response in
                switch response {
                case .success(let token) :
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.addValue("Bearer \(token.accessToken)", forHTTPHeaderField: "Authorization")
                    URLSession.shared.dataTask(with: request, completionHandler: {
                        taskData,taskResponse,error in
                        if let error = error {
                            print("Join Error : \(error.localizedDescription)")
                        }
                        if let httpresponse = taskResponse as? HTTPURLResponse, 200 == httpresponse.statusCode {
                            completion(.success(true))
                        } else {
                            completion(.failure(DataError.noData))
                        }
                    }).resume()
                case .failure(let error) :
                    completion(.failure(error))
                }
            })
        } else {
            completion(.failure(DataError.notValidateUrl))
        }
    }
    
    
    
    ///이름을 이용하여 현재 진행중인 주문을 확인합니다.
    func searchPost(text : String, completion : @escaping (Result<[Post],Error>) -> Void){
        let url = "http://moit-server-prod.eba-eecfjwgm.ap-northeast-2.elasticbeanstalk.com/api/v1/order"
        KeyChainModel.shared.readValue(completion: { response in
            switch response {
            case .success(let token):
                let authHeader : HTTPHeader = .init(name: "Authorization", value: "Bearer \(token.accessToken)")
                AF.request(url, method: .get, parameters: ["searchKey":text], headers: [authHeader])
                    .responseData(completionHandler: { responseData in
                        switch responseData.result {
                        case .success(let data):
                            do{
                                let results = try JSONDecoder().decode([String:[Post]].self
                                                                       , from: data)
                                if let result = results["orders"] {
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
    
    //모든 카테고리를 가져옵니다.
    func loadCategories() {
        if let url = URL(string: "http://moit-server-prod.eba-eecfjwgm.ap-northeast-2.elasticbeanstalk.com/api/v1/category") {
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "GET"
            KeyChainModel.shared.readValue(completion: { response in
                switch response{
                case.success(let token) :
                    request.addValue("Bearer \(token.accessToken)",
                                     forHTTPHeaderField: "Authorization")
                    URLSession.shared.dataTask(with: request, completionHandler: {
                        data,response,error in
                        if let error = error {
                            print("Load categories error : \(error.localizedDescription)")
                        }
                        if let data = data {
                            do {
                                print("Category Recives : \(String(data: data, encoding: .utf8))")
                                let result = try JSONDecoder().decode([String:[Category]].self, from: data)
                                if let list = result["categories"] {
                                    self.categories = list
                                    print("Categories : \(list)")
                                }
                            } catch let error {
                                print("Category Decode error : \(error.localizedDescription)")
                            }
                        } else {
                            print("Not loaded")
                        }
                    }).resume()
                case .failure(let error) :
                    print("Load keychain error : \(error.localizedDescription)")
                }
            })
        }
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
