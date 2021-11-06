//
//  MoitApp.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/05.
//

import SwiftUI
import GoogleSignIn

@main
struct MoitApp: App {
    
    init() {
        GIDSignIn.sharedInstance.restorePreviousSignIn(callback: { user,error in
            
        })
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    _ = GIDSignIn.sharedInstance.handle(url)
                })
        }
    }
}
