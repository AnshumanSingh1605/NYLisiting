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
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image.system(.person)
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text.text(.profile)
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 100)
            HStack {
                Image.system(.messages)
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text.text(.messages)
                    .foregroundColor(.gray)
                    .font(.headline)
            }
                .padding(.top, 30)
            HStack {
                Image.system(.settings)
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text.text(.settings)
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            Spacer()
        }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(red: 32/255, green: 32/255, blue: 32/255))
            .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
