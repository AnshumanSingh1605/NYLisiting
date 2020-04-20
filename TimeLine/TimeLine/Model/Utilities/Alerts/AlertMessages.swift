//
//  AlertMessages.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation
import SwiftUI

enum AlertMessages : Equatable {
    
    enum Message : String {
      
        case internetError = "Seems like you are offline! please check your internet connection"
        case serverError = "Oops! something went wrong at our end, we are trying to fix it."

        case `default` = "Sorry"
        
        case selectAppTheme = "Select the theme of the app."
        case selectPeriod = "Select the period of the articles."
        
        case profile = "Profile"
        case messages = "Messages"
        case settings = "Settings"
        
        case none = ""
        
        var value : String {
            return self.rawValue
        }
    }
   
    case custom(String), internetError, serverError
    case customOptional(String?)
    case `default` , none

    
    //Custom aletrts messages
    var value: Text {
        switch self {
        case .custom(let message):                              return Text(message)
        case .customOptional(let message):                      return Text(message ?? Message.serverError.value)
        case .internetError:                                    return .text(.internetError)
        case .serverError:                                      return .text(.serverError)
        case .none :                                            return .text(.none)
      
        default :                                               return .text(.default)
            
        }
    }
}
