//
//  JTMainViewController.swift
//  Swift-base
//
//  Created by 江豚os on 2017/11/22.
//  Copyright © 2017年 江豚os. All rights reserved.
//

import UIKit

class JTMainViewController: UITabBarController, UITabBarControllerDelegate {


    var hdhm01vc: JTHomeViewController!
    var hdcg01vc: JTHomeViewController!
    var hdgg01vc: JTHomeViewController!
    var hddy01vc: JTMessageViewController!
    var hdct01vc: JTHomeViewController!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.delegate = self
        setupTabBarView()
    }


    /**
     *  初始化Tabar
     */
    func setupTabBarView() {
        
        
        var navc: JTBaseNavigationController!
        
        /**
         *  首页
         */
        if hdhm01vc == nil {
            
            hdhm01vc = JTHomeViewController()
            hdhm01vc.tabBarItem = UITabBarItem(title: "菜谱", image: UIImage(named: "tab_icon_off_01")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "tab_icon_on_01")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
            hdhm01vc.title = "菜谱"
            navc = JTBaseNavigationController(rootViewController: hdhm01vc)
            self.addChildViewController(navc)
            
        }
        
        
        /**
         *  逛逛
         */
        if hdgg01vc == nil {
            
            hdgg01vc = JTHomeViewController()
            hdgg01vc.tabBarItem = UITabBarItem(title: "逛逛", image: UIImage(named: "tab_icon_off_04")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "tab_icon_on_04")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
            hdgg01vc.title = "逛逛"
            navc = JTBaseNavigationController(rootViewController: hdgg01vc)
            self.addChildViewController(navc)
            
        }
        
        /**
         *  分类
         */
        if hdcg01vc == nil {
            
            hdcg01vc = JTHomeViewController()
            hdcg01vc.tabBarItem = UITabBarItem(title: "分类", image: UIImage(named: "tab_icon_off_03")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "tab_icon_on_03")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
            hdcg01vc.title = "分类"
            navc = JTBaseNavigationController(rootViewController: hdcg01vc)
            self.addChildViewController(navc)
            
        }
        
        /**
         *  动态
         */
        
        if hddy01vc == nil {
            
            hddy01vc = JTMessageViewController()
            hddy01vc.tabBarItem = UITabBarItem(title: "动态", image: UIImage(named: "tab_icon_off_02")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "tab_icon_on_02")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
            hddy01vc.title = "动态"
            navc = JTBaseNavigationController(rootViewController: hddy01vc)
            self.addChildViewController(navc)
            
        }
        
        /**
         *  我的
         */
        if hdct01vc == nil {
            
            hdct01vc = JTHomeViewController()
            hdct01vc.tabBarItem = UITabBarItem(title: "我的", image: UIImage(named: "tab_icon_off_05")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "tab_icon_on_05")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
            hdct01vc.title = "我的"
            navc = JTBaseNavigationController(rootViewController: hdct01vc)
            self.addChildViewController(navc)
            
        }
        
    }
    
    // MARK: - UITabBarController delegate
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        return true
        /**
         *  双击TabItem添加自动下拉刷新
         */
//        let taSelectViewController = tabBarController.selectedViewController
//
//        if taSelectViewController!.isEqual(viewController) {
//
//            let navViewController = viewController as! UINavigationController
//            let rootViewController = navViewController.viewControllers[0]
//
//            if rootViewController.isKind(of: JTHomeViewController.classForCoder()) {
//
//                /**
//                 *  刷新菜谱主页
//                 */
//
//                NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.HDREFRESHHDHM01), object: nil, userInfo: ["FLAG": Constants.HDREFRESHHDHM01])
//
//            } else if rootViewController.isKind(of: JTHomeViewController.classForCoder()) {
//
//                /**
//                 *  刷新逛逛主页
//                 */
//                NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.HDREFRESHHDGG01), object: nil, userInfo: ["FLAG": Constants.HDREFRESHHDGG01])
//            }
//
//        }
//
//        return true
    }

}
