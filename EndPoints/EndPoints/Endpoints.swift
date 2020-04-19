//
//  Endpoints.swift
//  EndPoints
//
//  Created by Anshuman on 19/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftUI

public protocol Endpoints {
    var url: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var header: HTTPHeaders? { get }
    var queryParameter : [URLQueryItem]? { get }
}


public typealias ValidServerResponse<T> = T
//public typealias InvalidServerResponse<U> =  U

public typealias WebResponse = (Bool, Int, NSDictionary, String) -> Void
public typealias GenericWebResponse<ValidServerResponse : Codable> = (Bool, Int, ValidServerResponse?, APIError?) -> Void

public typealias Media = [String: Data]?

//MARK: - Common Properties and Configurations
public extension Endpoints {
    var base: String {
        return APIConstants.Defaults.base
    }
    private var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    private var urlEncoding:ParameterEncoding{
        return URLEncoding.default
    }
}

//MARK: - Webservice Interaction Method
public extension Endpoints {
    
    private func printRequest(_ api: Endpoints) {
        debugPrint("********************************* API Request **************************************")
        debugPrint("Request URL:\(api.url)")
        debugPrint("Request Parameters: \(api.parameters ?? [: ])")
        debugPrint("Request Headers: \(api.header ?? [:])")
    }
    
    // MARK: - Server request using generics.
    
    func requestWithGenerics<ValidServerResponse : Codable>  (
        responseClosure: @escaping GenericWebResponse<ValidServerResponse>) {
        
        if !NetworkReachabilityManager()!.isReachable {
            responseClosure(false,0,nil,.internetUnavailable)
            return
        }
        
        printRequest(self)        
        
        if self.queryParameter != nil {
            var _url = URLComponents(string: self.url)!
            _url.queryItems = self.queryParameter
            
            if !self.url.contains("?"){
                _url.percentEncodedQuery = url.removingPercentEncoding
            }
            
            AF.request(_url, method: method, parameters: parameters,
                       encoding: encoding, headers: header).responseJSON { (response) in
                        self.handleGenerics(response, responseClosure: { (result, code, model : ValidServerResponse?,error : APIError?)  in
                            responseClosure(result,code,model,error)
                        })
                        
            }
            
        } else {
            guard let _url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
            print(_url)
            AF.request(_url, method: method, parameters: parameters,encoding: encoding , headers:header).responseJSON { (response) in
                self.handleGenerics(response, responseClosure: { (result, code, model : ValidServerResponse?,error : APIError?)  in
                    responseClosure(result,code,model,error)
                })
            }
        }
        
    }
    
    private func handleGenerics<ValidServerResponse : Codable>(_ response: AFDataResponse<Any>, responseClosure: @escaping GenericWebResponse<ValidServerResponse>) {
        debugPrint("Request Response:----------")
        debugPrint(NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue) ?? "")
        debugPrint("************************************************************************************")
        
        switch response.result {
        case .success(_):
            do {
                if let data = response.data {
                    if let statusCode = response.response?.statusCode {
                        switch statusCode {
                        case 200, 201, 204:
                            if data.count == 0 {
                                responseClosure(statusCode == 200 || statusCode == 201 || statusCode == 204,statusCode,nil,nil)
                            } else {
                                let model = try JSONDecoder().decode(ValidServerResponse.self, from: data)
                                responseClosure(statusCode == 200 || statusCode == 201 || statusCode == 204,statusCode,model,nil)
                            }
                        case 400,401, 429:
                            do {
                                //returing error response from the server for invalid server response , or false case of an response.
                                let error = try JSONDecoder().decode(ErrorModel.self, from: data)
                                responseClosure(statusCode == 400 || statusCode == 401 || statusCode == 429, statusCode, nil, .custom(error.fault.faultstring))
                            } catch {
                                //returing error response from the server for invalid status code.
                                responseClosure(false, statusCode, nil,.invalidServerResponse)
                            }
                        default:
                            //returing error response from the server for invalid status code.
                            responseClosure(false, statusCode, nil,.invalidStatusCode)
                        }
                    } else {
                        //returing error response from the server for invalid status code.
                        responseClosure(false, 00, nil,.invalidStatusCode)
                    }
                } else {
                    //returing error response from the server for empty server response.
                    responseClosure(false, 00, nil,.emptyData)
                }
            } catch let error {
                print(error)
                //returing error response from the server for catch error descroption.
                responseClosure(false, 00, nil,.custom(error.localizedDescription))
            }
            
        case .failure:
            responseClosure(false, 00, nil,.requestFailed)
        }
    }
}

