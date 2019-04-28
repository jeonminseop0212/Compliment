//
//  AppDelegate.swift
//  Compliment
//
//  Created by jeonminseop on 2019/04/06.
//  Copyright © 2019 jeonminseop. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var orientationLock = UIInterfaceOrientationMask.all
  

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.orientationLock = .portrait
    
    var firstViewController = UIViewController()
    
    do {
      let realm = try Realm()
      if let goal = realm.objects(Goal.self).first {
        
        var isCheckToDay = false
        let checkList = realm.objects(Check.self)
        for check in checkList {
          if let date = check.date {
            if ComplimentFunction.shared.getStringDate(date: date) == ComplimentFunction.shared.getToday() {
              isCheckToDay = true
            }
          }
        }

        if isCheckToDay {
          let checkViewController = CheckViewController()
          firstViewController = checkViewController
        } else {
          let selectViewController = SelectViewController()
          firstViewController = selectViewController
        }
      } else {
        let createViewController = CreateViewController()
        firstViewController = createViewController
      }
    } catch {
      print("realm error")
    }
    
    let createViewNavigationContoller = UINavigationController(rootViewController: firstViewController)

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = createViewNavigationContoller
    window?.makeKeyAndVisible()
    
    return true
  }
  
  func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    return self.orientationLock
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

//  private func
}

