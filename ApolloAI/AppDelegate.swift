//
//  AppDelegate.swift
//  ApolloAI
//
//  Created by Luis F. Perrone on 2/1/19.
//  Copyright © 2019 Luis Perrone. All rights reserved.
//

extension UIStoryboard {
    
    class func viewControllerMain(identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
}

import UIKit
import EightBase
import Apollo

let graphQLEndpoint = "https://api.8base.com/cjrmxsa2m00dt01qudz4db5on"
let apollo = ApolloClient(url: URL(string: graphQLEndpoint)!)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        EightBase.auth(with: graphQLEndpoint, apiToken: "305b93f0-7247-4a1d-8e72-43ef75c4ec0a") { result in
            switch(result) {
            case .success():
                print("Successfully authentificated")
                break
            case .failure(let error):
                print("Failed with \(error)")
                break
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        return EightBase.resumeAuth(url, options: options)
    }


}

