//
//  Helper.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import SimpleKeychain
import AVFoundation

struct MyKeychain {
    
    static func string(forKey key: KeychainKey) -> String? {
        return A0SimpleKeychain().string(forKey: key.rawValue)
    }
    
    static func setString(_ string: String, forKey key: KeychainKey) {
        A0SimpleKeychain().setString(string, forKey: key.rawValue)
    }
    
    static func deleteEntry(forKey key: KeychainKey) {
        A0SimpleKeychain().deleteEntry(forKey: key.rawValue)
    }
}

struct MyNotify {
    
    static func send(name: NotifyKey) {
        NotificationCenter.default.post(name: Notification.Name(name.rawValue), object: nil)
    }
    
    static func send(name: NotifyKey, object: AnyObject) {
        NotificationCenter.default.post(name: Notification.Name(name.rawValue), object: object)
    }
    
    static func listen(_ me: Any, selector: Selector, name: NotifyKey) {
        NotificationCenter.default.addObserver(me, selector: selector, name: Notification.Name(name.rawValue), object: nil)
    }
    
    static func listen(name: NotifyKey, completion: @escaping Completion) {
        NotificationCenter.default.addObserver(forName: Notification.Name(name.rawValue), object: nil, queue: nil) { _ in
            completion()
        }
    }
    
    static func listen(name: NotifyKey, completion: @escaping (AnyObject) -> Void) {
        NotificationCenter.default.addObserver(forName: Notification.Name(name.rawValue), object: nil, queue: nil) { sender in
            completion(sender.object as AnyObject)
        }
    }
    
    static func remove(_ me: Any, name: String) {
        NotificationCenter.default.removeObserver(me, name: NSNotification.Name(rawValue: name), object: nil)
    }
}


struct MyDefaults {
    
    static func set(key: UserDefaultKey, value: Any?) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func get(key: UserDefaultKey) -> Any? {
        return UserDefaults.standard.object(forKey: key.rawValue)
    }
    
    static func bool(key: UserDefaultKey) -> Bool {
        return UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    static func int(key: UserDefaultKey) -> Int {
        return UserDefaults.standard.integer(forKey: key.rawValue)
    }
    
    static func float(key: UserDefaultKey) -> Float {
        return UserDefaults.standard.float(forKey: key.rawValue)
    }
    
    static func double(key: UserDefaultKey) -> Double {
        return UserDefaults.standard.double(forKey: key.rawValue)
    }
    
    static func string(key: UserDefaultKey) -> String {
        return UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    }
    
    static func dic(key: UserDefaultKey) -> [String: Any] {
        return UserDefaults.standard.dictionary(forKey: key.rawValue) ?? [:]
    }
    
    static func data(key: UserDefaultKey) -> Data {
        return UserDefaults.standard.data(forKey: key.rawValue) ?? Data()
    }
    
    static func array(key: UserDefaultKey) -> [Any] {
        return UserDefaults.standard.array(forKey: key.rawValue) ?? []
    }
    
    static func url(key: UserDefaultKey) -> URL? {
        return UserDefaults.standard.url(forKey: key.rawValue)
    }
}

struct UTF8 {
    
    static func encode(_ string:String) -> String! {
        let allowedCharacterSets = (NSCharacterSet.urlQueryAllowed as NSCharacterSet).mutableCopy() as! NSMutableCharacterSet
        allowedCharacterSets.removeCharacters(in: "!@#$%^&*()-_+=~`:;\"'<,>.?/")
        guard let encodeString = string.addingPercentEncoding(withAllowedCharacters: allowedCharacterSets as CharacterSet) else{
            return nil
        }
        
        return encodeString
    }
    
    static func decode(_ string:String) -> String! {
        guard let encodeString = string.removingPercentEncoding else{
            return nil
        }
        
        return encodeString
    }
    
    static func decodeForData(_ data: Data) -> Data! {
        guard let decode = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else{
            return nil
        }
        
        if let percentageDecode = decode.removingPercentEncoding {
            return percentageDecode.data(using: String.Encoding.utf8)
        }
        return decode.data(using: String.Encoding.utf8.rawValue)
    }
}

struct MySound {
    
    static private var player: AVAudioPlayer?
    
    static func play() {
        guard let url = Bundle.main.url(forResource: "beep", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
        }
        catch let error{
            print(error.localizedDescription)
        }
    }
}
