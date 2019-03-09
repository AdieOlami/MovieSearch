//
//  AppDelegate.swift
//  OneFi
//
//  Created by Olar's Mac on 3/7/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import UIKit
import netfox

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Start the Network request sniffer.
        if Configuration.buildType == .release {
            NFX.sharedInstance().start()
        }
        return true
    }

}

