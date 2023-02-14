//
//  AppDelegate.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import UIKit
import AlamofireEasyLogger

@main
class AppDelegate: UIResponder, UIApplicationDelegate, CocoaLumberjackProtocol {
    
    var window: UIWindow?
    
    #if DEBUG
    let alamofireLogger = FancyAppAlamofireLogger(prettyPrint: true) {
        debugPrint($0)
    }
    #endif

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let viewController = LoginViewController()
        viewController.viewModel = LoginViewModel(isLoginAsCustomer: true)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        setupCocoaLumberjack()
        
        return true
    }


}

