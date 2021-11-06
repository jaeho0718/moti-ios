//
//  LoginViewModel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import Foundation
import Alamofire

class LoginViewModel : ObservableObject{
    @Published var user : User?
    
    func signInWithIdToken(idToken : String) {
        let url = "https://accounts.google.com/o/oauth2/v2/auth?prompt=consent&response_type=code&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile&access_type=offline"
        //let paramter : [String:String] = ["redirect_uri":""]
        //AF.request(url, method: <#T##HTTPMethod#>, parameters: <#T##Encodable?#>, encoder: <#T##ParameterEncoder#>, headers: <#T##HTTPHeaders?#>, interceptor: <#T##RequestInterceptor?#>, requestModifier: <#T##Session.RequestModifier?##Session.RequestModifier?##(inout URLRequest) throws -> Void#>)
    }
    
    ///사용자 정보를 불러옵니다. 사용자 정보가 불러와지면, user변수에 저장됩니다.
    func getUserData(completion : @escaping (Result<User,Error>) -> Void){
        KeyChainModel.shared.readValue(completion: { response in
            switch response {
            case .success(let token):
                if let url = URL(string: "" ) {
                    var request = URLRequest(url: url)
                    request.httpMethod = "GET"
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.addValue("Authorization",
                                     forHTTPHeaderField: "Bearer \(token.accessToken)")
                    URLSession.shared.dataTask(with: request, completionHandler: {
                        taskData,taskResponse,error in
                        if let taskData = taskData {
                            do {
                                let result = try JSONDecoder().decode(User.self, from: taskData)
                                self.user = result
                                completion(.success(result))
                            } catch let error {
                                completion(.failure(error))
                            }
                        } else {
                            completion(.failure(DataError.loginError))
                        }
                    }).resume()
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    
    ///이메일로 로그인합니다, Response로 온 Accesstoken을 키체인에 저장하는 기능은 별도로 구현해야함.
    func loginWithEmail(email : String, password : String,
                        completion : @escaping (Result<LoginResponse,Error>) -> Void ) {
        if let url = URL(string: "http://moit-server-prod.eba-eecfjwgm.ap-northeast-2.elasticbeanstalk.com/api/v1/auth/login") {
            do {
                let bodyData : [String : String] = ["email":email
                                                    ,"password" : password]
                let encodedBodyData = try JSONEncoder().encode(bodyData)
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.httpBody = encodedBodyData
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.cachePolicy = .returnCacheDataElseLoad
                URLSession.shared.dataTask(with: request, completionHandler: {
                    data,response,error in
                    if let error = error {
                        print("Request Error : \(error.localizedDescription)")
                    }
                    if let data = data, let response = response as? HTTPURLResponse
                        , 200...399 ~= response.statusCode  {
                        do {
                            let responseData = try JSONDecoder()
                                                        .decode(LoginResponse.self, from: data)
                            completion(.success(responseData))
                        } catch let error {
                            completion(.failure(error))
                        }
                    } else {
                        completion(.failure(DataError.loginError))
                    }
                }).resume()
            } catch let error {
                // Encode 실패
                print("Encode error : \(error.localizedDescription)")
                completion(.failure(error))
            }
        } else {
            print("URL Error")
            completion(.failure(DataError.notValidateUrl))
            // 올바르지 않은 URL
        }
    }
    
    /// 이메일을 이용해 회원가입합니다.
    func signInWithEmail(email : String,name : String,phoneNumber : String,password : String,
                         completion : @escaping (Result<Int,Error>) -> Void ) {
        if let url = URL(string: "http://moit-server-prod.eba-eecfjwgm.ap-northeast-2.elasticbeanstalk.com/api/v1/user") {
            var request = URLRequest(url: url)
            do {
                let body_data = try JSONEncoder().encode(["email":email,"name" : name,
                                                          "phoneNumber" : phoneNumber,
                                                          "password" : password])
                print("Send \(String(data: body_data, encoding: .utf8))")
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = body_data
                request.httpMethod = "POST"
                URLSession.shared.dataTask(with: request, completionHandler: {
                    data,response,error in
                    if let error = error {
                        print("Create user error : \(error.localizedDescription)")
                    }
                    if let httpResponse = response as? HTTPURLResponse
                        , 200 ... 399 ~= httpResponse.statusCode{
                        completion(.success(1))
                    } else {
                        completion(.failure(DataError.loginError))
                    }
                }).resume()
            } catch let error {
                completion(.failure(error))
            }
        } else {
            completion(.failure(DataError.notValidateUrl))
        }
    }
}
