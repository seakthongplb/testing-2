//
//  UIViewController+Helper.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import UIKit

extension UIViewController {
      
    func gotoAppSettings() {
        if #available(iOS 10.0, *) {
            DispatchQueue.main.async {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
            }
        }
    }
    
    func gotoPasscodeSettings() {
        if #available(iOS 10.0, *) {
            DispatchQueue.main.async {
                UIApplication.shared.open(URL(string: "App-Prefs:root=TOUCHID_PASSCODE" + Bundle.main.bundleIdentifier!)!, options: [:], completionHandler: nil)
            }
        }
    }
    
    func checkAllowNotificationPermission(completion: @escaping Completion_Bool) {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().getNotificationSettings { (settings) in
                if settings.authorizationStatus != .authorized {
                    DispatchQueue.main.async {
                        completion(false)
                    }
                }
                else {
                    DispatchQueue.main.async {
                        completion(true)
                    }
                }
            }
        }
    }
    
    func popOrDismissVC(animated: Bool = true, completion: @escaping Completion = { }) {
        if let nav = self.navigationController {
            nav.popViewController(animated: animated)
            completion()
        }
        else {
            self.dismiss(animated: animated) {
                completion()
            }
        }
    }
    
    
    func pushVC(viewController: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func navController(sbName: String, identifier: String) -> UINavigationController {
        return UIStoryboard(name: sbName, bundle: nil).instantiateViewController(withIdentifier: identifier) as! UINavigationController
    }
    
    // Important
    func setRootViewController(sbName: String, identifier: String, direction: UIWindow.TransitionOptions.Direction = .fade, duration: TimeInterval = 0.3) {
        let window              = UIApplication.shared.keyWindow
        var animateOption       = UIWindow.TransitionOptions()
        animateOption.direction = direction
        animateOption.duration  = duration
        window?.setRootViewController(VC(sbName: sbName, identifier: identifier), options: animateOption)
    }
    
    // Important
    func setRootViewController(viewController: UIViewController, direction: UIWindow.TransitionOptions.Direction = .fade, duration: TimeInterval = 0.3) {
        let window              = UIApplication.shared.keyWindow
        var animateOption       = UIWindow.TransitionOptions()
        animateOption.direction = direction
        animateOption.duration  = duration
        window?.setRootViewController(viewController, options: animateOption)
    }
    
    // Important
    func setRootNavViewController(sbName: String, identifier: String, direction: UIWindow.TransitionOptions.Direction = .fade, duration: TimeInterval = 0.3) {
        let window              = UIApplication.shared.keyWindow
        var animateOption       = UIWindow.TransitionOptions()
        animateOption.direction = direction
        animateOption.duration  = duration
        window?.setRootViewController(navController(sbName: sbName, identifier: identifier), options: animateOption)
    }
    
    // Important
    func setRootNavViewController(navigation: UINavigationController, direction: UIWindow.TransitionOptions.Direction = .fade, duration: TimeInterval = 0.3) {
        let window              = UIApplication.shared.keyWindow
        var animateOption       = UIWindow.TransitionOptions()
        animateOption.direction = direction
        animateOption.duration  = duration
        window?.setRootViewController(navigation, options: animateOption)
    }
    
    func VC(sbName: String, identifier: String) -> UIViewController {
        return UIStoryboard(name: sbName, bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    func PopupVC(storyboard: String, identifier: String) -> UIViewController {
        let vc = UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: identifier)
        vc.modalPresentationStyle = .custom
        vc.modalTransitionStyle = .crossDissolve
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        
        return vc
    }
    
    func alert(title: String, message: String, completion: @escaping Completion = { }) {
        if let jsonData = message.data(using: String.Encoding.utf8) {
            do {
                try JSONSerialization.jsonObject(with: jsonData)
                alertJsonError(title: title, message: message)
            }
            catch {
                let alert   = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let ok      = UIAlertAction(title: "OK".capitalized, style: .cancel) { (_) in
                    completion()
                }
                alert.addAction(ok)
                
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    private func alertJsonError(title: String, message: String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.left
        
        let messageText = NSMutableAttributedString(
            string: message,
            attributes: [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12),
                NSAttributedString.Key.foregroundColor : UIColor.black
            ]
        )
        
        let alert   = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok      = UIAlertAction(title: "OK".capitalized, style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.setValue(messageText, forKey: "attributedMessage")
        
        present(alert, animated: true, completion: nil)
    }
    
    func alertYesNo(title: String, message: String, nobtn: String = "NO".capitalized, yesbtn: String = "YES".capitalized
                    , completion: @escaping Completion_Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: yesbtn, style: .default, handler: { (action) -> Void in
                completion(true)
            })
        )
        alert.addAction(
            UIAlertAction(title: nobtn, style: .cancel)
        )
        
        self.present(alert, animated: true, completion: nil)
    }
      
}

