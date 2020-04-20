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

        var value : String {
            return self.rawValue
        }
    }
}
