//
//  ResponseParserProtocol.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import Alamofire

protocol ResponseParserProtocol {
    func parse(json: Any)
    func handleError(error: AFError)
    func handleInvalidResponse(_ response: Any)
}

extension ResponseParserProtocol {
    func handleInvalidResponse(_ response: Any) {
        debugPrint("Invalid response: \(response)")
    }
    
//    func handleInvalidToken(errorCode: Any?) -> Bool {
//        guard let code = errorCode as? String else {
//            return false
//        }
//        if code == NotificatonKey.ERROR_TOKEN.rawValue || code == NotificatonKey.ACCESS_DENIED.rawValue{
//            NotificationCenterHelper.send(name: .ACCESS_DENIED)
//            return true
//        }
//        return false
//    }
}
