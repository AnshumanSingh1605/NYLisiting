//
//  UserDefaultManager.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation
import Combine

final class UserDefaultsManager : ObservableObject {
    
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
            print("key is....\(key)")
            if key != UserDefaultConstants.backupDataSaveTo.value {
                print("removing value for....\(key)")
                defaults.removeObject(forKey: key)
            }
        }
        defaults.synchronize()
    }
    
    @Published var loginToken : String? = UserDefaults.standard.string(forKey: UserDefaultConstants.loginToken.value) {
        didSet {
            guard let _logintoken = self.loginToken else { return }
            set(value: _logintoken, forKey: .loginToken)
        }
    }
 
    @Published var isUserLoggedIn : Bool = UserDefaults.standard.bool(forKey: UserDefaultConstants.isUserLoggedIn.value) {
        didSet {
            set(value: self.isUserLoggedIn, forKey: .isUserLoggedIn)
            //self.isUserLoggedIn ? nil : remove(forkey: .loginToken)
            if !self.isUserLoggedIn {
                resetDefaults()
            }
        }
    }
    
    @Published var isPatientProfileCompleted : Bool = UserDefaults.standard.bool(forKey: UserDefaultConstants.isPatientProfileCompleted.value) {
        didSet {
            set(value: self.isPatientProfileCompleted, forKey: .isPatientProfileCompleted)
        }
    }
    
    @Published var isAutoLogoutEnabled : Bool = UserDefaults.standard.bool(forKey: UserDefaultConstants.isAutoLogoutEnabled.value) {
        didSet {
            set(value: self.isAutoLogoutEnabled, forKey: .isAutoLogoutEnabled)
        }
    }

    @Published var backupDataSaveTo: String? = UserDefaults.standard.string(forKey: UserDefaultConstants.backupDataSaveTo.value) //?? Constants.Strings.saveInfoOnCloud
        {
        didSet {
            set(value: backupDataSaveTo as Any, forKey: .backupDataSaveTo)
        }
    }
    
    @Published var usernameLastLoggedIn: String = UserDefaults.standard.string(forKey: UserDefaultConstants.usernameLastLoggedIn.value) ?? "" {
        didSet {
            set(value: usernameLastLoggedIn, forKey: .usernameLastLoggedIn)
        }
    }
    
    
    @Published var accountOwnerInfo : Data? = UserDefaults.standard.data(forKey: UserDefaultConstants.accountOwnerInfo.value) {
        didSet {
            set(value: accountOwnerInfo as Any, forKey: .accountOwnerInfo)
        }
    }
    
    @Published var userEmailAddress : String = UserDefaults.standard.string(forKey: UserDefaultConstants.userEmailAddress.value) ?? String() {
        didSet {
            set(value: userEmailAddress , forKey: .userEmailAddress)
        }
    }
}
