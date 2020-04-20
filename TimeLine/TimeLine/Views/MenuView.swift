//
//  MenuView.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import SwiftUI

//struct MenuView: View {
//
//    @Binding var showMenu : Bool
//
//    var body: some View {
//        Color.blue
//    }
//}
//
//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView(showMenu: .constant(true))
//    }
//}

struct MenuView: View {
    
    private let periodValueChanged = NotificationCenter.default.publisher(for: .periodValueChangedForMenu)
    
    @ObservedObject var viewModel = MenuViewModel()
    
    @Binding var showMenu : Bool

    var body: some View {
        ScrollView {
          VStack(alignment: .leading) {
              VStack(alignment: .leading) {
                  Text.text(.selectAppTheme)
                      .foregroundColor(.secondary)
                  
                  RadioButton(arrValues: self.viewModel.arrThemes, selectedValue: self.$viewModel.theme)
              }
              .padding(.top, 120)
              
              VStack(alignment: .leading) {
                  Text.text(.selectPeriod)
                      .foregroundColor(.secondary)
                  
                  RadioButton(arrValues: self.viewModel.arrPeriods, selectedValue: self.$viewModel.period)
              }
              .padding(.top, 30)
              
              Spacer()
          }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.tertiaryBackground)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            withAnimation {
                self.showMenu.toggle()
            }
        }
        .onReceive(periodValueChanged) { (output) in
            withAnimation {
                DispatchQueue.main.async {
                    self.showMenu = false
                    NotificationCenter.default.post(name: .periodValueChanged, object: nil)
                }
            }
        }
    }
}
