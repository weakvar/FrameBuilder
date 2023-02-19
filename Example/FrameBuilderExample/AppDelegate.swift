//
//  AppDelegate.swift
//  FrameBuilderExample
//
//  Created by Vladislav Kulikov on 19.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let messengerViewController = MessengerViewController()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = messengerViewController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
    
}
