//
//  MenuModel.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation
import Combine

final class MenuViewModel : ObservableObject {
    
    let arrThemes : [Constants.Theme] = [.light,.dark]
    let arrPeriods : [Int] = [1,7,30]
    
    @Published var period : Int  = UserDefaultsManager.shared.period {
        willSet {
            if newValue != UserDefaultsManager.shared.period {
                UserDefaultsManager.shared.period = newValue
                NotificationCenter.default.post(name: .periodValueChangedForMenu, object: nil)
            }
        }
    }
    
    @Published var theme : Constants.Theme = UserDefaultsManager.shared.userPreferredTheme {
        didSet {
            print("theme changed....")
            UserDefaultsManager.shared.userPreferredTheme = self.theme
        }
    }
}
