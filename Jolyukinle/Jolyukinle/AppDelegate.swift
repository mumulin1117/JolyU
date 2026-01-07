//
//  AppDelegate.swift
//  Jolyukinle
//
//  Created by  on 2026/1/5.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let nameroot = UINavigationController(rootViewController: (TOWINKLIopVibeRoute.TOWINKLIopSessionToken == nil) ? TOWINKLIopPortalViewController() : TOWINKLIopGrandFestiveStage())
        
        
        nameroot.navigationBar.isHidden = true
        window?.rootViewController = nameroot
        window?.makeKeyAndVisible()
        return true
    }

}

