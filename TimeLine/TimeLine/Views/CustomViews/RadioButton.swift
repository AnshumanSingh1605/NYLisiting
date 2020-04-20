//
//  RadioButton.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import SwiftUI

struct RadioButton<T>: View where T : CustomStringConvertible {
    
    let arrValues : [T]
    var alignment: Constants.Alignment = .horizontal

    @Binding var selectedValue : T

    var body : some View {
        HStack(spacing : 0) {
            if alignment ==  .horizontal {
                HStack(spacing : 0) {
                    ForEach(self.arrValues, id : \.description) { value in
                        HStack {
                            CheckBoxView(selectedValue: self.$selectedValue, text: value)
                            Spacer()
                        }
                    }
                }
            }
            else {
                VStack(alignment: .leading, spacing : 20) {
                    ForEach(self.arrValues, id : \.description) { value in
                        VStack {
                            CheckBoxView(selectedValue: self.$selectedValue, type: .circle, text: value)
                            //Spacer()
                        }
                    }
                }
            }
        }
    }
}


