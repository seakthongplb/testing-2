//
//  Constant.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import Foundation

typealias Completion                = ()                -> Void
typealias Completion_Int            = (Int)             -> Void
typealias Completion_Bool           = (Bool)            -> Void
typealias Completion_NSError        = (NSError?)        -> Void
typealias Completion_String         = (String)          -> Void
typealias Completion_String_Error   = (String, Error?)  -> Void

enum NotifyKey: String {
    case login
}

enum KeychainKey: String {
    case accessToken
    case refreshToken
}

enum UserDefaultKey: String {
    case firstLaunch
}
