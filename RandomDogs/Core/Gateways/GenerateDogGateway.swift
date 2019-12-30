//
//  GenerateDogGateway.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/29/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation

typealias GenerateDogEntityGatewayCompletionHandler = (_ result: ResultValue<RandomDog>, _ clientError: APIClientError) -> Void

protocol GenerateDogGateway {
    func generateRandomDog(request: APIRequest, completionHandler:@escaping GenerateDogEntityGatewayCompletionHandler)
}
