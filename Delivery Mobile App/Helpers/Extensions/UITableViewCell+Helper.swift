//
//  UITableViewCell+Helper.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import UIKit

extension UITableViewCell {
    
    class func reuseIdentifier() -> String {
        let className = NSStringFromClass(self)
        let components = className.components(separatedBy: ".")
        return components.count > 1 ? components[1] : className
    }
    
    
    class func nib() -> UINib {
        return UINib(nibName: reuseIdentifier(), bundle: nil)
    }
    
    class func registerNibCell(_ tableView: UITableView) {
        tableView.register(nib(), forCellReuseIdentifier: reuseIdentifier())
    }
    
    class func registerNibCell(_ tableView: UITableView, reuseIdentifier: String) {
        tableView.register(nib(), forCellReuseIdentifier: reuseIdentifier)
    }
    
    class func registerClass(_ tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: reuseIdentifier())
    }
    
    class func registerClass(_ tableView: UITableView, reuseIdentifier: String) {
        tableView.register(self, forCellReuseIdentifier: reuseIdentifier)
    }

}
