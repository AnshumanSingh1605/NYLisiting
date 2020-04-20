//
//  UserDefaultManager.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation
import Combine

final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    func set(value: Any, forKey key: UserDefaultConstants) {
        UserDefaults.standard.setValue(value, forKey: key.value)
        UserDefaults.standard.synchronize()
    }
    
    func remove(forkey key: UserDefaultConstants) {
        UserDefaults.standard.removeObject(forKey: key.value)
    }
    
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
        defaults.synchronize()
    }
    
    var userPreferredTheme : Constants.Theme  {
        get {
            guard let theme = UserDefaults.standard.string(forKey: UserDefaultConstants.kuserPreferredAppTheme.value) else {
                return .light
            }
            return Constants.Theme(rawValue: theme) ?? .light
        } set(userTheme) {
            set(value: userTheme.rawValue, forKey: .kuserPreferredAppTheme)
        }
    }
    
    var appTheme : Constants.Theme? {
        get {
            guard let theme = UserDefaults.standard.string(forKey: UserDefaultConstants.kappTheme.value) else {
                return nil
            }
            return Constants.Theme(rawValue: theme)
        }
        set(appTheme) {
            set(value: appTheme?.rawValue as Any, forKey: .kappTheme)
        }
    }
    
    var period : Int = UserDefaults.standard.value(forKey: UserDefaultConstants.kPeriodOfArticle.value) as? Int ?? 1 {
        didSet {
            set(value: period, forKey: .kPeriodOfArticle)
        }
    }

}
