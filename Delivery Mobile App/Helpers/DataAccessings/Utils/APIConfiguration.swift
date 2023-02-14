//
//  APIConfiguration.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import Foundation

protocol Configuration {
    var baseUrl: String { get }
    var secretKey: String { get }
    var oneSignalAppId: String { get }
}

extension Configuration {
    var oneSignalAppId: String {
        guard let infoDictionary = Bundle.main.infoDictionary,
              let appId = infoDictionary["ONESIGNAL_APP_ID"] as? String else { return "" }
        return appId
    }
    
    var baseUrl: String {
        guard let infoDictionary = Bundle.main.infoDictionary,
              let url = infoDictionary["BASE_URL"] as? String else { return "" }
        return url
    }
    
    var secretKey: String {
        return "4NYxnTLQn72jakJHYHXODkCFbzGofoml"
    }
}
