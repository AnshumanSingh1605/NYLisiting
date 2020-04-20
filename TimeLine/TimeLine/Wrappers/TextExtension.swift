//
//  TextExtension.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation
import SwiftUI

extension Text {
    static func text(_ message : AlertMessages.Message) -> Text {
        return Text(message.value)
    }
    
    static func text(_ display : Constants.Texts) -> Text {
        return Text(display.value)
    }
    
    static func optionalText(_ value : String?) -> Text {
        if let _value = value {
            return Text(_value)
        }
        return Text(String())
    }
}


