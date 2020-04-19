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
        case primary , secondary , tertiary , tertiaryBackground , backgroundGray ,quaternary , baseline , shadow
        case custom(String)
        var value : Color {
            switch self {
            case .primary:                  return Constants.Colors.primary.value
            case .secondary:                return Constants.Colors.secondary.value
            case .tertiary :                return Constants.Colors.tertiary.value
            case .quaternary :              return Constants.Colors.quaternary.value
            case .baseline :                return Constants.Colors.baseline.value
            case .tertiaryBackground :      return Constants.Colors.backgroundTertiary.value
            case .backgroundGray :          return Constants.Colors.backgroundGray.value
            case .shadow:                   return Constants.Colors.shadow.value
            case .custom(let colorName):    return .init(colorName)
            }
        }
    }
}
