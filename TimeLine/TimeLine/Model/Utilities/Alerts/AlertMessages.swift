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
        case userNameRequired = "Please enter your email id."
        case passwordRequired = "Please enter your password."
        case confirmPasswordRequired = "Please confirm your password."
        case cameraSupport = "Sorry your device's camera is not supporting."
        case errorDownloading = "Oops! Something went wrong while downloading your file."
        case downloaded = "Yay!, file saved succesfully."
        case `default` = "Sorry"
        case none = ""
        
        var value : String {
            return self.rawValue
        }
    }
   
    case custom(String), internetError, serverError
    case `default` , none

    
    //Custom aletrts messages
    var value: Text {
        switch self {
        case .custom(let message):                              return Text(message)
        case .internetError:                                    return .text(.internetError)
        case .serverError:                                      return .text(.serverError)
        case .none :                                            return .text(.none)
      
        default :                                               return .text(.default)
            
        }
    }
}
