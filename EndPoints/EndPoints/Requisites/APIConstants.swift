//
//  APIConstants.swift
//  EndPoints
//
//  Created by Anshuman on 19/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation

enum APIConstants {
    enum Defaults {
        static let token = "default token"
        static let apiKey = "GUj6w0bVmRH35Ikn5UpOKGNGVmQ93oUe"
        static let contentType = "application/json"
        static let base = "https://api.nytimes.com/svc/mostpopular/v2/viewed/"
        static let imageBase = "https://api.nytimes.com/svc/mostpopular/v2/shared/{period}.json"
        
        static let key_authorization = "Authorization"
        static let key_contentType = "Content-Type"
        static let key_status = "Status"

    }
}
