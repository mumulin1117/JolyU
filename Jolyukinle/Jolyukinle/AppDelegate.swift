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
        
        let TOWINKLIopnameroot = UINavigationController(rootViewController: (TOWINKLIopVibeRoute.TOWINKLIopSessionToken == nil) ? TOWINKLIopPortalViewController() : TOWINKLIopGrandFestiveStage())
        
        
        TOWINKLIopnameroot.navigationBar.isHidden = true
        window?.rootViewController = TOWINKLIopnameroot
        window?.makeKeyAndVisible()
        return true
    }

}

