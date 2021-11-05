//
//  MoitApp.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI

import KakaoSDKCommon
import KakaoSDKAuth

@main
struct MoitApp: App {
    
    init(){
        // Kakao SDK 초기화
        KakaoSDKCommon.initSDK(appKey: "2bca4e4909a3358d1b0089fc8d82d590")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    if AuthApi.isKakaoTalkLoginUrl(url) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                })
        }
    }
}
