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
    
    public var description : String {
        return self.localizedDescription
    }
    
    public var message : String {
        switch self {
        case .invalidRequest:                 return "Sorry! unable to request."
        case .invalidStatusCode:              return "Sorry! invalid status code occured."
        case .internetUnavailable:            return "Please check your internet connection."
        case .custom(let error):              return error
        default:                              return "Oops! something went wrong at our side, our team is looking at it."
        }
    }
}
