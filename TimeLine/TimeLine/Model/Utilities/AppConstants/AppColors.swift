//
//  AppColors.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation
import SwiftUI

extension Constants {
    enum Colors : String {
        
        case background, border, buttonBG, navBar, text117, textAction, textOnDark,
        shadow, darkButtonBG, silver, homeBG , backgroundTertiary , backgroundGray
        
        case primary, secondary, tertiary ,quaternary
        case buttonBackground , baseline , navColor
        
        var value: Color {
            return Color(rawValue)
        }
    }
}
