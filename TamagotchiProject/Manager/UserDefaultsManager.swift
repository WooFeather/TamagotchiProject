//
//  UserDefaultsManager.swift
//  TamagotchiProject
//
//  Created by 조우현 on 2/21/25.
//

import Foundation

@propertyWrapper
struct MyUserDefaults<T> {
    let key: String
    let defaultValue: T
    
    var wrappedValue: T {
        get {
            UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

enum UserDefaultsManager {
    enum Key: String {
        case isSigned
        case tamagotchiName
        case nickname
        case level
        case riceCount
        case waterCount
    }
    
    @MyUserDefaults(key: Key.isSigned.rawValue, defaultValue: false)
    static var isSigned
    
    @MyUserDefaults(key: Key.tamagotchiName.rawValue, defaultValue: "")
    static var tamagotchiName
    
    @MyUserDefaults(key: Key.nickname.rawValue, defaultValue: "대장")
    static var nickname
    
    @MyUserDefaults(key: Key.level.rawValue, defaultValue: 1)
    static var level
    
    @MyUserDefaults(key: Key.riceCount.rawValue, defaultValue: 0)
    static var riceCount
    
    @MyUserDefaults(key: Key.waterCount.rawValue, defaultValue: 0)
    static var waterCount
}
