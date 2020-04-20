//
//  ContentView.swift
//  TimeLine
//
//  Created by Anshuman on 19/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import SwiftUI
import EndPoints

struct ContentView: View {
    
    @State var showMenu = false
    @State private var showCancelButton: Bool = false
        
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
        }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    TimeLineView(showMenu: self.$showMenu,showCancelButton: self.$showCancelButton)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .disabled(self.showMenu)
                    if self.showMenu {
                        MenuView(showMenu: self.$showMenu)
                            .frame(width: geometry.size.width - 150)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
            }
            .background(.primary)
            .navigationBarTitle(.text(.navTitle), displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }) {
                    Image.system(.hamburger)
                        .imageScale(.large)
                        .foregroundColor(.white)
                }
                , trailing:
                Button(action: {
                    withAnimation {
                        self.showCancelButton.toggle()
                    }
                }) {
                    Image.system(.search)
                        .foregroundColor(.white)
                        .opacity(self.showCancelButton ? 0 : 1)
                }
                .disabled(self.showCancelButton)
            )
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
