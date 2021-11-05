//
//  LoginViewModel.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import Foundation
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewModel : ObservableObject{
    @Published var user : User?
    
    /// 카카오로 로그인합니다.
    func loginWithKakao(completion : @escaping () -> Void){
        if UserApi.isKakaoTalkLoginAvailable(){
            //기기에 카카오톡이 설치되어있으면, 앱실행을 통해 로그인합니다.
            UserApi.shared.loginWithKakaoTalk(completion: { (oauthToken, error) in
                if let error = error {
                    print("KakaoLogin error : \(error.localizedDescription)")
                } else if let token = oauthToken {
                    
                }
            })
        } else {
            //기기에 카카오톡이 미설치되어있으면, 계정입력을 통해 로그인합니다.
            UserApi.shared.loginWithKakaoAccount(prompts: [.Login], completion: {
                (oauthToken, error) in
                if let error = error {
                    print("KakaoLogin error : \(error.localizedDescription)")
                } else if let token = oauthToken{
                    
                }
            })
        }
    }
    
}
