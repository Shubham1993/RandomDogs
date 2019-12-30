//
//  ApiRequestClient.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/29/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation
import Alamofire

protocol APIRequest {
    var url : String { get }
    var method : HTTPMethod { get }
    var parameters : Parameters { get }
    var encoding : ParameterEncoding { get }
    var headers : HTTPHeaders { get }
}

protocol APIRequestClient {
    func execute(request : APIRequest, completionHandler: @escaping (_ result: DataResponse<Any>) -> Void)
}

class APIRequestClientImplementation: APIRequestClient {
    
    private let sessionManager: SessionManager
    
    init() {
        sessionManager = SessionManager.default
    }
    
    func execute(request : APIRequest, completionHandler: @escaping (_ result: DataResponse<Any>) -> Void) {
        sessionManager.request(request.url, method: request.method, parameters: request.parameters, encoding: request.encoding, headers: request.headers).validate().responseJSON { result in
            completionHandler(result)
        }
    }
}
