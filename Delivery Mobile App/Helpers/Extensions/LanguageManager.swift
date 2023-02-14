//
//  LanguageManager.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import Foundation

extension String {
    
    var localized: String {
        get {
            if let path     = Bundle.main.path(forResource: "LocalizedString", ofType: "json") {
                if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) {
                    if let dic = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        // to get value of key
                        if let keyDic =  dic[self] as?  [String:String] {
                            let value = keyDic[Shared.share.language.rawValue]!
                            return value
                        }
                    }
                }
            }
            
            return self
        }
    }
}
