//
//  AppTheme.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation
import SwiftUI

enum Constants {
    enum AppTheme {
        case primary , secondary
        case tertiary , tertiaryBackground
        case shadow
        case base
        case custom(String)
        
        var value : Color {
            switch self {
            case .primary:                  return UserDefaultsManager.shared.appTheme == .light ? .white : .black
            case .secondary:                return UserDefaultsManager.shared.appTheme == .light ? .black : .white
            case .tertiary :                return UserDefaultsManager.shared.appTheme == .light ? .gray : .init(white: 0.5)
            case .tertiaryBackground :      return UserDefaultsManager.shared.appTheme == .light ? .init(white: 0.8) : .init(white: 0.2)
            case .shadow:                   return UserDefaultsManager.shared.appTheme == .light ? Color(white: 0.7) : Color(white: 0.3)
            case .base:                     return UserDefaultsManager.shared.appTheme == .light ? Color(white: 0.9) : Color(white: 0.9)
            case .custom(let colorName):    return .init(colorName)
            }
        }
    }
}
