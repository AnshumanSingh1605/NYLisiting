//
//  AlertEssentials.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation
import SwiftUI

typealias NullableCompletion = (()->Void)?

enum AlertTitle {
    
    case appName
    case custom(String)
    
    var value: Text {
        switch self {
        case .appName:
            guard let name = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String else {
                return Text("TimeLine")
            }
            return Text(name)
        case .custom(let name): return Text(name)
        }
    }
}

enum AlertButton {
    
    case ok(NullableCompletion)
    case cancel, settings
    case custom(String, NullableCompletion)
    case `default`(NullableCompletion)
    case yes(NullableCompletion)
    case delete(NullableCompletion)
    
    var name: Text {
        switch self {
        case .ok:                       return Text("Ok")
        case .custom(let value, _):     return Text(value)
        case .settings:                 return Text("Settings")
        case .yes :                     return Text("Yes")
        case .delete:                   return Text("Delete")
        default :                       return Text("Ok")
        }
    }
    
    var action: NullableCompletion {
        switch self {
        case .ok(let closure) :         return closure
        case .default(let closure) :    return closure
        case .cancel:                   return nil
        case .custom(_, let closure):   return closure
        case .settings:                 return Utility.methodToOpenSettings
        case .yes(let closure):         return closure
        case .delete(let closure):      return closure
        }
    }

    var style : Alert.Button {
        switch self {
        case .cancel : return action == nil ? .cancel() : .cancel(action)
        default : return action == nil ? .default(name) : .default(name, action: action)
        }
    }
}

enum Alerts {
    static func showAlert(title : AlertTitle = .appName,message : AlertMessages, dismiss : AlertButton) -> Alert {
        Alert(title: title.value, message: message.value, dismissButton: dismiss.style)
    }
    
    static func showAlert(title : AlertTitle = .appName,message : AlertMessages, primary : AlertButton,secondary : AlertButton) -> Alert {
        Alert(title: title.value, message: message.value, primaryButton: primary.style, secondaryButton: secondary.style)
    }
    
    static func showAlert(title : AlertTitle = .appName ,primary : AlertButton,secondary : AlertButton) -> Alert {
        Alert(title: title.value, primaryButton: primary.style, secondaryButton: secondary.style)
    }
}
