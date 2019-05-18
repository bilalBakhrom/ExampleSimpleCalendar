//
//  AppDelegate.swift
//  Example
//
//  Created by Bilal Bakhrom on 18/05/2019.
//  Copyright © 2019 Bilal Bakhrom. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let root = ExampSimpleCalendar()
        let navigationController = UINavigationController(rootViewController: root)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()        
        return true
    }

}

