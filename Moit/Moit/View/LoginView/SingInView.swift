//
//  SingInView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var login : LoginViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var email : String = ""
    @State private var name : String = ""
    @State private var phoneNumber : String = ""
    @State private var password : String = ""
    
    var body: some View {
        VStack(spacing:50){
            Group{
                HStack{
                    Text("회원 가입").font(.custom("DoHyeon-Regular", size: 28))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.top,20)
                .padding(.bottom,50)
                TextField("이메일 주소",text: $email).keyboardType(.emailAddress)
                    .textFieldStyle(BorderedTextFieldStyle())
                TextField("이름",text: $name).keyboardType(.namePhonePad)
                    .textFieldStyle(BorderedTextFieldStyle())
                TextField("전화번호",text: $phoneNumber).keyboardType(.namePhonePad)
                    .textFieldStyle(BorderedTextFieldStyle())
                SecureField("비밀번호", text: $password)
                    .textFieldStyle(BorderedTextFieldStyle())
                Spacer()
                
            }
            .padding(.horizontal,15)
            Button(action:{
                login.signInWithEmail(email: email, name: name,
                                      phoneNumber: phoneNumber, password: password, completion: {
                    response in
                    switch response {
                    case .success(_) :
                        login.loginWithEmail(email: email, password: password, completion: { result in
                            switch result {
                            case .success(let token) :
                                KeyChainModel.shared.createValue(data: token, completion: {
                                    keyResult in
                                    switch keyResult {
                                    case .success(_) :
                                        presentationMode.wrappedValue.dismiss()
                                    case .failure(let error) :
                                        print("KeyChain save error : \(error.localizedDescription)")
                                    }
                                })
                            case .failure(let error) :
                                print("Sign In error : \(error.localizedDescription)")
                            }
                        })
                    case .failure(let error) :
                        print("Sign In error : \(error.localizedDescription)")
                    }
                })
            }){
                Text("회원가입")
                    .font(.custom("DoHyeon-Regular", size: 18))
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity,minHeight:50)
            }.background(Color("AppAccentColor").ignoresSafeArea())
            .disabled(password.isEmpty || email.isEmpty || name.isEmpty || phoneNumber.isEmpty)
        }
    }
}

struct SingInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(LoginViewModel())
    }
}
