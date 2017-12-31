//
//  AppDelegate.swift
//  iOS Example
//
//  Created by Toshinori Watanabe on 12/31/17.
//  Copyright © 2017 Toshinori Watanabe. All rights reserved.
//

import UIKit
import Henry

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {

        Henry.enabled()

        return true
    }

}
