//
//  Shared.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import Foundation

enum LanguageCode: String {
    case English    = "en"
    case Khmer      = "km"
}


struct Shared {
    
    //MARK:- singleton
    static var share = Shared()
    
    private init() { }
    
    var language    : LanguageCode = .Khmer
    var token       : String?
    
}
