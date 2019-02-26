//
//  AppDelegate.swift
//  DealTyme
//
//  Created by Ali Apple on 09/01/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import GoogleMaps
import GoogleSignIn
//import FacebookLogin
//import FBSDKLoginKit
//import FacebookCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url as URL?,
                                                 sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                                 annotation: options[UIApplication.OpenURLOptionsKey.annotation])
    }
    
//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
//    }


    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //        UINavigationBar.appearance().barTintColor = UIColor(white: 1, alpha: 0.0)
        //        UINavigationBar.appearance().tintColor = UIColor(white: 1, alpha: 0.0)
        Fabric.with([Crashlytics.self])
        GIDSignIn.sharedInstance().clientID = "447547827555-cnmfovhod5h7e3u2et5fd5u1svmnnkqm.apps.googleusercontent.com"
        let lagFreeField: UITextField = UITextField()
        window?.addSubview(lagFreeField)
        lagFreeField.becomeFirstResponder()
        lagFreeField.resignFirstResponder()
        lagFreeField.removeFromSuperview()
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
//        //        UIApplication.shared.statusBarStyle = .lightContent
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().isTranslucent = true
//        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        GMSServices.provideAPIKey("AIzaSyCpiZBu0HwWpcEMY74GISIzA3v6TFm_t1s")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
//        UITableViewCell.appearance().selectedBackgroundView = .clear
        navigationController = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navigationController
//        window?.rootViewController = UINavigationController(rootViewController: ViewController())
//        window?.rootViewController = ViewController()
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


}

