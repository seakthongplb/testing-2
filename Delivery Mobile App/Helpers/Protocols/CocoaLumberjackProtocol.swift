//
//  CocoaLumberjackProtocol.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import CocoaLumberjack

protocol CocoaLumberjackProtocol {
    func setupCocoaLumberjack()
    func writeLog(with message: String)
}

extension CocoaLumberjackProtocol {
    func setupCocoaLumberjack() {
        DDLog.add(DDOSLogger.sharedInstance) // Uses os_log
        let fileLogger: DDFileLogger = DDFileLogger() // File Logger
        fileLogger.rollingFrequency = 60 * 60 * 24 // 24 hours
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        DDLog.add(fileLogger)
    }
    
    func writeLog(with message: String) {
        DDLogInfo(message)
    }
}

