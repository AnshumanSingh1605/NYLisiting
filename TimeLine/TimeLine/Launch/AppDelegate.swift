//
//  AppDelegate.swift
//  TimeLine
//
//  Created by Anshuman on 19/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //predict the theme of the app initially.
        predictAppMode()
        
        // Updating the appearance of the table view and its cell.
        UITableView.appearance().separatorColor = .clear
        UITableView.appearance().backgroundColor = .clear
        
        UITableViewCell.appearance().backgroundColor = .clear
        UITableViewCell.appearance().selectionStyle = .none

        // Updating the appearance of the navigation bar.
        UINavigationBar.appearance().barTintColor = Constants.Colors.navColor
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white ]

        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // To predict the launch mode of the application...
    private func predictAppMode() {
        if UserDefaultsManager.shared.appTheme == nil {
            if UITraitCollection.current.userInterfaceStyle == .light {
                UserDefaultsManager.shared.appTheme = .light
                UserDefaultsManager.shared.userPreferredTheme = .light
            } else {
                UserDefaultsManager.shared.appTheme = .dark
                UserDefaultsManager.shared.userPreferredTheme = .dark
            }
        } else {
            // assigning the user preference app theme for the app presentation
            UserDefaultsManager.shared.appTheme = UserDefaultsManager.shared.userPreferredTheme
        }
    }
}



