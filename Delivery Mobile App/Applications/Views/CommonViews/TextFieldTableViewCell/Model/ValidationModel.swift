//
//  ValidationModel.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/15/21.
//

import Foundation

struct ValidationModel {
    var minLength: Int
    var maxLength: Int
    var minKHR: Decimal
    var maxKHR: Decimal
    var minUSD: Decimal
    var maxUSD: Decimal
    var allowDecimal: Bool
    
    init(with data: [String: Any]) {
        minLength = data["minLength"] as? Int ?? 0
        maxLength = data["maxLength"] as? Int ?? 0
        minKHR = data["minKHR"] as? Decimal ?? 0
        maxKHR = data["maxKHR"] as? Decimal ?? 0
        minUSD = data["minUSD"] as? Decimal ?? 0
        maxUSD = data["maxUSD"] as? Decimal ?? 0
        allowDecimal = data["allowDecimal"] as? Bool ?? false
    }
}
