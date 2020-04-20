//
//  UserDefaultsConstants.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation

enum UserDefaultConstants {
    case kappTheme
    case kuserPreferredAppTheme
    case kPeriodOfArticle
    var value: String {
        switch self {
        case .kappTheme:                         return "applicationAppTheme"
        case .kuserPreferredAppTheme:            return "userPreferredAppTheme"
        case .kPeriodOfArticle:                  return "userPreferredPeriodOfArticle"
        }
    }
}
