//
//  UserDefaultsConstants.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation

enum UserDefaultConstants {
    case loginToken , isUserLoggedIn , isPatientProfileCompleted, isAutoLogoutEnabled, autoLogoutWhenEnabledTimestamp, logoutAfterTimeInSeconds,
    backupDataSaveTo, usernameLastLoggedIn , accountOwnerInfo , userEmailAddress , user_id
    
    case unitWeight , unitHeight
        
    var value: String {
        switch self {
        case .loginToken:                                       return "usersLoginTokenSavedWhileLogin"
        case .isUserLoggedIn :                                  return "isUserAlreadyLoggedIn"
        case .isPatientProfileCompleted :                       return "isPatientProfileCompleted"
        case .isAutoLogoutEnabled:                              return "isAutoLogoutEnabled"
        case .autoLogoutWhenEnabledTimestamp:                   return "autoLogoutWhenEnabledTimestamp"
        case .logoutAfterTimeInSeconds:                         return "logoutAfterTimeInSeconds"
        case .backupDataSaveTo:                                 return "backupDataSaveTo"
        case .usernameLastLoggedIn:                             return "usernameLastLoggedIn"
        case .accountOwnerInfo:                                 return "accountOwnerData"
        case .userEmailAddress:                                 return "userEmailAddress"
        case .user_id:                                          return "accountOwnerId"
        
        case .unitHeight:                                       return "preferredUnitForHeight"
        case .unitWeight:                                       return "preferredUnitForWeight"
        }
    }
}
