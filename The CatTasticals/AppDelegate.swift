//
//  AppDelegate.swift
//  The CatTasticals
//
//  Created by Louis Tur on 5/11/15.
//  Copyright (c) 2015 Louis Tur. All rights reserved.
//

import UIKit

struct SRParseConsts {
    struct ParseKeys {
        static let applicationKey = "0IXWFYf07gN2E5vISPjijAcAIwxzgkAVHuH9koku"
        static let clientKey = "lSw4qQRgzb60hrGQPDJx0pfy5NEcBsigWtVauIWC"
    }
    
    struct CatTasticalConsts {
        static let nameKey = "name"
        static let catClassKey = "Cat"
    }
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        Parse.setApplicationId(SRParseConsts.ParseKeys.applicationKey, clientKey: SRParseConsts.ParseKeys.clientKey)
        
        var tableVC:SRCatTableViewController = SRCatTableViewController(className: SRParseConsts.CatTasticalConsts.catClassKey)
        tableVC.title = "Much Ado Cats!"
        UINavigationBar.appearance().tintColor = UIColor(red: 0.05, green: 0.47, blue: 0.91, alpha: 1.0)
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.05, green: 0.47, blue: 0.91, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        var navigationVC:UINavigationController = UINavigationController(rootViewController: tableVC)
        let frame = UIScreen.mainScreen().bounds
        window = UIWindow(frame: frame)
        
        window!.rootViewController = navigationVC
        window!.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

