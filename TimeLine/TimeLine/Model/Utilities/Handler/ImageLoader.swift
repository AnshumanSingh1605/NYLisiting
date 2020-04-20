//
//  ImageLoader.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class RemoteImageURL : ObservableObject {
    @Published var data = Data()
    
    init(imageURL : String) {
        guard let url = URL(string: imageURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, resoponse, error) in
            guard let _data = data else { return }
            
            DispatchQueue.main.async {
                self.data = _data
            }
        }.resume()
    }
}

struct ImageViewContainer : View {
    @ObservedObject var remoteImageURL : RemoteImageURL
    
    init(imageURL : String) {
        remoteImageURL = RemoteImageURL(imageURL: imageURL)
    }
    
    var body : some View {
        Image(uiImage: (remoteImageURL.data.isEmpty) ? UIImage() :  UIImage(data: remoteImageURL.data) ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fill)
            //.frame(width: 80, height: 80)
        
    }
}

