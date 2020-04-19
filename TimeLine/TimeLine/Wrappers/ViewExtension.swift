//
//  ViewExtension.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    func foregroundColor(_ color : Constants.AppTheme) -> some View {
        foregroundColor(color.value)
    }
    func background(_ color : Constants.AppTheme) -> some View {
        background(color.value)
    }
}

extension View {
    // If condition is met, apply modifier, otherwise, leave the view untouched
    public func conditionalModifier<T>(_ condition: Bool, _ modifier: T) -> some View where T: ViewModifier {
        Group {
            if condition {
                self.modifier(modifier)
            } else {
                self
            }
        }
    }

    // Apply trueModifier if condition is met, or falseModifier if not.
    public func conditionalModifier<M1, M2>(_ condition: Bool, _ trueModifier: M1, _ falseModifier: M2) -> some View where M1: ViewModifier, M2: ViewModifier {
        Group {
            if condition {
                self.modifier(trueModifier)
            } else {
                self.modifier(falseModifier)
            }
        }
    }
}

//extension View {
//
//    func toast(isShowing: Binding<Bool>, text: Text) -> some View {
//        Toast(isShowing: isShowing,
//              presenting: { self },
//              text: text)
//    }
//
//}
