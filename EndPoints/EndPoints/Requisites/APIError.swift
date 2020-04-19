//
//  APIError.swift
//  EndPoints
//
//  Created by Anshuman on 19/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation

public enum APIError : Error {
    
    case invalidRequest
    case internetUnavailable
    case parsingError
    case requestTimeOut
    case invalidServerResponse
    case invalidStatusCode
    case emptyData
    case requestFailed
    case custom(String)
    
    var description : String {
        return self.localizedDescription
    }
}
