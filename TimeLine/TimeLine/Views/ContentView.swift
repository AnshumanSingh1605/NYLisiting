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
                    TimeLineView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        //.offset(x: self.showMenu ? geometry.size.width - 300 : 0)
                        .disabled(self.showMenu)
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width - 150)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
                .onTapGesture {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }
            }
            .navigationBarTitle(.text(.navTitle), displayMode: .inline)
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }) {
                        Image.system(.hamburger)
                        //Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                ))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



