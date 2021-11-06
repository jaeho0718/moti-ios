//
//  SplashView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI
import AlertToast

struct SplashView: View {
    @EnvironmentObject var login : LoginViewModel
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var openSingin : Bool = false
    @State private var onLoad : Bool = false
    @State private var loginNeeded : Bool = false
    @State private var isOpen : Bool = true
    
    var body: some View {
        ZStack(alignment:.topTrailing){
            if isOpen{
                Rectangle()
                    .foregroundColor(Color("AppAccentColor"))
                    .ignoresSafeArea()
                VStack(alignment:.trailing,spacing: 11){
                    Group{
                        Text("한번에")
                        Text("빠르게")
                        Text("moit")
                    }.font(.custom("DoHyeon-Regular", size: 49))
                    .foregroundColor(.white)
                    
                    if loginNeeded {
                        VStack(alignment:.trailing){
                            TextField("이메일", text: $email).keyboardType(.emailAddress)
                                .textFieldStyle(BorderedTextFieldStyle())
                            SecureField("비밀번호", text: $password)
                                .textFieldStyle(BorderedTextFieldStyle())
                            HStack(spacing:20){
                                Button(action:{
                                    openSingin.toggle()
                                }){
                                    Text("회원가입")
                                        .font(.custom("DoHyeon-Regular", size: 16))
                                        .frame(maxWidth:.infinity,minHeight: 35)
                                }.background(Color.white).cornerRadius(8)
                                Button(action:{
                                    onLoad = true
                                    login.loginWithEmail(email: email, password: password, completion: {
                                        response in
                                        onLoad = false
                                        switch response {
                                        case .success(let token) :
                                            print("Login Success : \(token.accessToken)")
                                            KeyChainModel.shared.updateValue(data: token, completion: {
                                                keyResponse in
                                                switch keyResponse {
                                                case .success(_) :
                                                    isOpen = false
                                                case .failure(let error):
                                                    print("Key chain error : \(error.localizedDescription)")
                                                }
                                            })
                                        case .failure(let error) :
                                            print("Login Error : \(error.localizedDescription)")
                                        }
                                    })
                                }){
                                    Text("로그인")
                                        .font(.custom("DoHyeon-Regular", size: 16))
                                        .frame(maxWidth:.infinity,minHeight: 35)
                                }.background(Color.white).cornerRadius(8)
                                .disabled(email.isEmpty || password.isEmpty)
                            }.padding(.top,10)
                        }.frame(width:300).padding(.top,50)
                    }
                    
                }.padding(.top,130)
                .padding(.trailing,29)
            }
        }
        .sheet(isPresented: $openSingin, content: {
            SignInView()
        })
        .toast(isPresenting: $onLoad, alert: {
            AlertToast(displayMode: .alert, type: .loading)
        })
        .onAppear{
            login.getUserData(completion: { response in
                switch response {
                case .success(_) :
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                        self.isOpen = false
                    })
                case .failure(let error) :
                    print("AutoLogin error : \(error.localizedDescription)")
                    loginNeeded = true
                }
            })
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .environmentObject(LoginViewModel())
    }
}
