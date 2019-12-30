//
//  ApiGenerateDogGateway.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/29/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation
protocol ApiGenerateDogGateway: GenerateDogGateway {
    
}

class ApiGenerateDogGatewayImplementation: ApiGenerateDogGateway {

    let client: APIRequestClient

    init(client: APIRequestClient) {
        self.client = client
    }
    
    func generateRandomDog(request: APIRequest, completionHandler: @escaping GenerateDogEntityGatewayCompletionHandler) {
        self.client.execute(request: request) { response in
            switch response.result {
            case .success:
                do {
                    let responseObject = try JSONSerialization.jsonObject(with: response.data!, options: []) as? NSDictionary
                    guard responseObject != nil else {
                        throw NSError.createError(withMessage: "Failed to get Dog Image")
                    }
                    
                    guard let data = response.data, let randomDog: RandomDog = try? RandomDog.decodeObject(withData: data) else {
                        throw NSError.createError(withMessage: "Failed to get Dog Image")
                    }
                    completionHandler(.success(randomDog), .kSuccess)
                } catch let error {
                    completionHandler(.failure(error), .kParseError)
                }
                break
            case .failure(let error):
                guard let statusCode = response.response?.statusCode, statusCode == 201 else {
                    completionHandler(.failure(error), .kUnknownError)
                    break
                }
                completionHandler(.failure(error), .kUnknownError)
                break
            }
        }
    }
}
