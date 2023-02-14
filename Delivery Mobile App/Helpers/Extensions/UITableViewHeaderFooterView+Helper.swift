//
//  UITableViewHeaderFooterView+Helper.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import UIKit

extension UITableViewHeaderFooterView {
    class func reuseIdentifier() -> String {
        let className = NSStringFromClass(self)
        let components = className.components(separatedBy: ".")
        return components.count > 1 ? components[1] : className
    }
    
    class func nib() -> UINib {
        return UINib(nibName: reuseIdentifier(), bundle: nil)
    }
    
    class func registerNib(_ tableView: UITableView) {
        tableView.register(nib(), forHeaderFooterViewReuseIdentifier: reuseIdentifier())
    }
    
    class func registerNib(_ tableView: UITableView, reuseIdentifier: String) {
        tableView.register(nib(), forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }
    
    class func registerClass(_ tableView: UITableView) {
        tableView.register(self, forHeaderFooterViewReuseIdentifier: reuseIdentifier())
    }
    
    class func registerClass(_ tableView: UITableView, reuseIdentifier: String) {
        tableView.register(self, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }
}

