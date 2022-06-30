//
//  AppDelegate.swift
//  DzKit
//
//  Created by 陈毅琥 on 2022/6/30.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let testController = UIViewController()
        testController.view.backgroundColor = .red
        window?.rootViewController = testController
        window?.makeKeyAndVisible()
        //ceshi
        return true
    }


}

