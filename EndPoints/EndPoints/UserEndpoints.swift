//
//  UserEndpoints.swift
//  EndPoints
//
//  Created by Anshuman on 19/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation
import Alamofire

public enum UserEndpoints: Endpoints {
    
    case fetchListing(_ page : Int)
    
    public var url: String {
        switch self {
        case .fetchListing(let period) :        return "\(base)\(period).json?api-key=\(APIConstants.Defaults.apiKey)"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
            
        // MARK: - Get requests
        case .fetchListing:                    return .get
            
        }
    }
    
    public var parameters: Parameters? {
        
        switch self {
        default:                               return nil
            
        }
    }
    
    public var header: HTTPHeaders? {
        var headers = HTTPHeaders()
        headers[APIConstants.Defaults.key_contentType] = APIConstants.Defaults.contentType
//        switch self {
//        default:
//            if let token = UserDefaultsManager().loginToken {
//                if token != Constants.Defaults.token {
//                    headers[Constants.Defaults.key_authorization] = "Token \(token)"
//                }
//            }
//        }
        return headers
    }
    
    public var queryParameter: [URLQueryItem]? {
        switch self {
        default :                                                     return nil
        }
    }
}
