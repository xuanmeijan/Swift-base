//
//  AppDelegate.swift
//  Swift-base
//
//  Created by 江豚os on 2017/11/22.
//  Copyright © 2017年 江豚os. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
         window = UIWindow(frame: UIScreen.main.bounds)
        
        setUpBarStyle()
        setEnterController()
        
       
//        let vc = JTMainViewController()
//        window?.rootViewController = vc;
        window?.makeKeyAndVisible()
        return true
    }


    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
       
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }

    //设置初始化控制器
    func setEnterController() {
        /**
         *  判断欢迎界面是否已经执行
         */
        
        let userDefault = UserDefaults.standard
        let appVersion: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        
        
        if (userDefault.string(forKey: Constants.HDAppVersion)) == nil {
            
            //第一次进入
            userDefault.setValue(appVersion, forKey: Constants.HDAppVersion)
            userDefault.synchronize()
            self.window?.rootViewController = JTWelcomeController()
            
        } else {
            
            //版本升级后，根据版本号来判断是否进入
            self.window?.rootViewController = JTWelcomeController()
            
//            let version: String = (userDefault.string(forKey: Constants.HDAppVersion))!
//            if ( appVersion == version) {
//
//                //                UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
//                self.window?.rootViewController = JTMainViewController()
//
//            } else {
//
//                userDefault.setValue(appVersion, forKey: Constants.HDAppVersion)
//                userDefault.synchronize()
//                self.window?.rootViewController = JTWelcomeController()
//
//            }
            
        }
    }
    
    //配置tabar参数
    func setUpBarStyle() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "Heiti SC", size: 18.0)!]
        UINavigationBar.appearance().barTintColor = Constants.HDMainColor
        
        /**
         *  底部TabBar的颜色
         */
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().tintColor = UIColor.hexInt(0xFFFFFF)
        UITabBar.appearance().backgroundColor = UIColor.hexInt(0xFFFFFF)
        UITabBar.appearance().barTintColor = UIColor.hexInt(0xFFFFFF)
        
        /**
         *  底部TabBar字体正常状态颜色
         */
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: Constants.HDMainTextColor, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13)], for: UIControlState.normal)
        /**
         *  底部TabBar字体选择状态颜色
         */
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: Constants.HDMainColor, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13)], for: UIControlState.selected)
    }

}

