//
//  String+Helper.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import Foundation
import UIKit

extension String {
    
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isNotEmpty: Bool {
        return self.trim != ""
    }
    
    var toInt: Int {
        return Int(self) ?? 0
    }
    
    var toDouble: Double {
        return Double(self) ?? 0
    }
    
    var toDoubleWithSpecialChar: Double {
        var str = self
        if self.contains(",") {
            str = self.replace(of: ",", with: "")
        }
        return Double(str) ?? 0
    }
    
    var camelCased: String {
        return (self as NSString)
            .replacingOccurrences(of: "([A-Z])", with: " $1", options:
                                    .regularExpression, range: NSRange(location: 0, length: count))
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .capitalized
    }
    
    mutating func replaced(of: String, with: String) {
        self = self.replacingOccurrences(of: of, with: with)
    }
    
    func replace(of: String, with: String) -> String {
        return self.replacingOccurrences(of: of, with: with)
    }
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func validate(regex: String) -> Bool {
        let char = self.cString(using: String.Encoding.utf8)
        if (strcmp(char, "\\b") != -92) {
            return NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: self)
        }
        return true
    }
    
    // for USD
    func formatUSDCurrency() -> String {
        
        var intNumber : Double = 0
        var str = ""
        
        if self.contains(".") {
            let splitSelf = self.components(separatedBy: ".")
            if let myNumber = NumberFormatter().number(from: splitSelf[0]) {
                intNumber = myNumber.doubleValue
            }
            var mycurrencyStr = String(intNumber)
            if intNumber < 0 {
                mycurrencyStr = "-" + String(intNumber)
            }
            let currencyFormatter               = NumberFormatter()
            currencyFormatter.numberStyle       = .decimal
            currencyFormatter.locale            = Locale(identifier: "en_US")
            currencyFormatter.currencyCode      = ""
            currencyFormatter.currencySymbol    = ""
            
            let currencyStr = currencyFormatter.string(from: NSNumber(value: Double(mycurrencyStr) ?? 0)) ?? ""
            str = currencyStr + ".\(splitSelf[1])"
            
        } else {
            if let myNumber = NumberFormatter().number(from: self) {
                intNumber = myNumber.doubleValue
            }
            var mycurrencyStr = String(intNumber)
            if intNumber < 0 {
                mycurrencyStr = "-" + String(intNumber)
            }
            let currencyFormatter               = NumberFormatter()
            currencyFormatter.numberStyle       = .decimal
            currencyFormatter.locale            = Locale(identifier: "en_US")
            currencyFormatter.currencyCode      = ""
            currencyFormatter.currencySymbol    = ""
            
            let currencyStr = currencyFormatter.string(from: NSNumber(value: Double(mycurrencyStr) ?? 0)) ?? ""
            str = currencyStr
        }
        return str
    }
    
    var fromBase64: String? {
        guard let data = Data(base64Encoded: self, options: Data.Base64DecodingOptions(rawValue: 0)) else {
            return nil
        }
        return String(data: data as Data, encoding: String.Encoding.utf8)
    }
    
    var toBase64: String? {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
    
    // Convert String  to UIImage
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
            return UIImage(data: data)
        }
        return nil
    }
    
    func base64ToImage() -> UIImage? {
        if let url = URL(string: self),let data = try? Data(contentsOf: url),let image = UIImage(data: data) {
            return image
        }
        return nil
    }
    
    func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
}
