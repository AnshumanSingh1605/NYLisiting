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
    var body: some View {
        Text("Hello, World!")
            .onAppear() {
                self.run()
        }
    }
    
    private func run() {
        UserEndpoints.fetchListing(1).requestWithGenerics { (isSuccess, code, model : ValidServerResponse?, error) in
            print(model)
            print(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ValidServerResponse : Codable {
    
}
