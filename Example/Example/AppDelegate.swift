//
//  AppDelegate.swift
//  Example
//
//  Created by Hilal  Al Hakkani on 28/02/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupRootVC()
        // Override point for customization after application launch.
        return true
    }
    
    func setupRootVC(){
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let homeVC = HomeRouter.createHomeModule()
        window?.rootViewController = homeVC
        window?.makeKeyAndVisible()
    }
 


}

