//
//  GoogleSingInButtonView.swift
//  Moit
//
//  Created by Lee Jaeho on 2021/11/06.
//

import Foundation
import SwiftUI
import GoogleSignIn

struct GooleSignInButtonView : View {
    var body: some View {
        Button(action:{
            let signInConfig = GIDConfiguration(clientID: "307929164328-v5nbse3goqs8bptneu7g730g6ms2feib.apps.googleusercontent.com"
                                            ,serverClientID: "307929164328-pdi9emc79h4rcb936pf45j2fsauh1u7e.apps.googleusercontent.com")
            guard let viewcontroller = UIApplication.shared.keyWindowPresentedController
            else {return}
            GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: viewcontroller, callback: { user,error in
                if let error = error {
                    print("GoogleSignIn Error : \(error)")
                }
                guard let user = user else { return }
                user.authentication.do(freshTokens: { authentication, error in
                    guard let authentication = authentication else { return }
                    let idToken = authentication.idToken
                })
            })
        }){
            Text("GoogleLogin")
        }
    }
}



extension UIApplication {
    
    var keyWindow: UIWindow? {
        // Get connected scenes
        return UIApplication.shared.connectedScenes
            // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
            // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
            // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
}

extension UIApplication {
    
    var keyWindowPresentedController: UIViewController? {
        var viewController = self.keyWindow?.rootViewController
        
        // If root `UIViewController` is a `UITabBarController`
        if let presentedController = viewController as? UITabBarController {
            // Move to selected `UIViewController`
            viewController = presentedController.selectedViewController
        }
        
        // Go deeper to find the last presented `UIViewController`
        while let presentedController = viewController?.presentedViewController {
            // If root `UIViewController` is a `UITabBarController`
            if let presentedController = presentedController as? UITabBarController {
                // Move to selected `UIViewController`
                viewController = presentedController.selectedViewController
            } else {
                // Otherwise, go deeper
                viewController = presentedController
            }
        }
        
        return viewController
    }
    
}
