//
//  Checkbox.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import SwiftUI

struct CheckBoxView <T> : View where T: CustomStringConvertible {
    
    enum ButtonType {
        case square, circle
    }
    
    @Binding var selectedValue : T
    var type : ButtonType = .square
    var text : T

    var body : some View {
        Button(action: {
            self.selectedValue = self.text
        }) {
            
            HStack(alignment: .center, spacing: 10) {
                
                Image.system(self.selectedValue.description == self.text.description ? (self.type == .square ? .checkedSquare : .checkedCirle) : (self.type == .square ? .square : .circle))
                    .foregroundColor(.secondary)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20, alignment: .center)
                
                Text(self.text.description)
                    .fixedSize(horizontal: true, vertical: false)
                    .foregroundColor(.secondary)
            }
        }
    }
}
