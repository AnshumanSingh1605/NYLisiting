//
//  AppConstants.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation

extension Constants {
    
    enum Theme : String , CustomStringConvertible {
        case light ,dark
        
        var description: String {
            return self.rawValue
        }
    }
    
    enum Texts : String {
        
        case pleaseWait = "Please Wait..."
        case navTitle = "NY Times Most Viewed"
        case next = "Next"
        case finish = "Finish"
        
        var value : String {
            return self.rawValue
        }
    }
    
    enum Alignment {
        case horizontal
        case vertical
    }
}
