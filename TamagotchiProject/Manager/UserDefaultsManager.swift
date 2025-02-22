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
        case tamagotchiImageData
        case tamagotchiName
        case nickname
    }
    
    @MyUserDefaults(key: Key.isSigned.rawValue, defaultValue: false)
    static var isSigned
    
    @MyUserDefaults(key: Key.tamagotchiImageData.rawValue, defaultValue: Data())
    static var tamagotchiImageData
    
    @MyUserDefaults(key: Key.tamagotchiName.rawValue, defaultValue: "")
    static var tamagotchiName
    
    @MyUserDefaults(key: Key.nickname.rawValue, defaultValue: "대장")
    static var nickname
}
