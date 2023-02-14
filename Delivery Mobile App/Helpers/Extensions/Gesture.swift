//
//  Gesture.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import UIKit

extension UIView {
   
   func didTap(completion: @escaping Completion) {
       let tap = CompletionGesture(target: self, action: #selector(didTapCallback(_:)))
       tap.completion = completion
       
       self.isUserInteractionEnabled = true
       addGestureRecognizer(tap)
   }
   
   @objc fileprivate func didTapCallback(_ sender: CompletionGesture) {
       sender.completion()
   }
   
   // ----------------------------------------------------------------------
   func addTapGesture(target: Any?, selector: Selector) {
       self.isUserInteractionEnabled = true
       self.addGestureRecognizer(
           UITapGestureRecognizer(target: target, action: selector)
       )
   }
   
   func addPanGesture(target: Any?, selector: Selector) {
       self.isUserInteractionEnabled = true
       self.addGestureRecognizer(
           UIPanGestureRecognizer(target: target, action: selector)
       )
   }
}

class CompletionGesture: UITapGestureRecognizer {
   var completion = { }
}

class MyTapGesture: UITapGestureRecognizer {
   var dic = [String: AnyObject]()
}

// ------------------------------------------------------------------

/// Target-Action helper.
class Action: NSObject {
   private var _action = { }
   
   init(action: @escaping () -> Void) {
       super.init()
       self._action = action
   }
   
   @objc func action() {
       _action()
   }
}

 

