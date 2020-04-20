//
//  AppImages.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation

extension Constants {
    enum ImagesString : String {
        
        case hamburger = "line.horizontal.3"
        case person = "person"
        case messages = "envelope"
        case settings = "gear"
        case calendar = "calendar"
        case disclosure = "chevron.right"
        case checkedSquare = "checkmark.square"
        case checkedCirle = "checkmark.circle"
        case square = "square"
        case circle = "circle"
        case search = "magnifyingglass"
        case cross = "xmark.circle.fill"
        
        var value : String {
            return self.rawValue
        }
    }
}
