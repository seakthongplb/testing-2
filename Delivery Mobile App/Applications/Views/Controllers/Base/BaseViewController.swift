//
//  BaseViewController.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - VIEW Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerObserver()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func setTapBarHidden(_ status: Bool = true) {
        tabBarController?.tabBar.isHidden = status
    }
    
    func setNavigationBarHidden(_ status: Bool) {
        navigationController?.setNavigationBarHidden(status, animated: false)
    }
    
    
    // MARK: - Method
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return navigationController?.viewControllers.count ?? 0 > 1
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    private func registerObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardDidHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Keyboards
    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.3) {
                
            }
        }
    }
    
    @objc func keyBoardDidHide(notification: Notification) {
        UIView.animate(withDuration: 0.3) { }
    }
}
