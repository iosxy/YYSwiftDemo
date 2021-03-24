//
//  AppDelegate.swift
//  FirstSwiftDemo
//
//  Created by lzt on 2021/3/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configerWindow()
        setRootWindow()
        
        return true
    }

    func configerWindow(){
        window = UIWindow()
        // Override point for customization after application launch.
       // UIApplication.shared.statusBarStyle = .default
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.white.cgColor)
        context!.fill(rect)
        UIGraphicsEndImageContext()
        
    }
    func setRootWindow(){
        
        let tabbar = YDBaseTabbarController()
        
        let homeNav = YDBaseNavigationController.init(rootViewController: YDHomeViewController())
        
        let mineNav = YDBaseNavigationController.init(rootViewController: YYMineViewController())
        
        let homeItem = UIBarButtonItem.init(title: "首页", style: .done, target: nil, action: nil)
        let mineItem = UIBarButtonItem.init(title: "我的", style: .done, target: nil, action: nil)
        
        tabbar.setViewControllers([homeNav , mineNav], animated: true)
        
        tabbar.setToolbarItems([homeItem , mineItem], animated: true)
        tabbar.setToolbarItems([homeItem , mineItem], animated: true)
        self.window?.rootViewController = tabbar
    }

}

