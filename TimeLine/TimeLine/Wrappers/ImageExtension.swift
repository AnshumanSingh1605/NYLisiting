//
//  ImageExtension.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation
import SwiftUI

extension Image {
    static func system(_ image : Constants.ImagesString) -> Image {
        Image(systemName: image.value)
    }
}
