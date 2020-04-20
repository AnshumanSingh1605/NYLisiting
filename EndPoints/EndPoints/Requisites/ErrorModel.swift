//
//  ErrorModel.swift
//  EndPoints
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation

/**

{"fault":{"faultstring":"Invalid ApiKey","detail":{"errorcode":"oauth.v2.InvalidApiKey"}}}


**/

struct ErrorModel : Codable {
    let fault : FaultModel
}

struct FaultModel : Codable {
    let faultstring  : String
    let detail : FaultDetailModel
}

struct FaultDetailModel : Codable {
    let errorcode : String
}
