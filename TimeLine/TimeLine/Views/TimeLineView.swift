//
//  TimeLineView.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import SwiftUI

struct TimeLineView : View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
               self.showMenu = true
            }
        }) {
            Text("Show Menu")
        }
    }
}

struct TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineView(showMenu: .constant(false))
    }
}
