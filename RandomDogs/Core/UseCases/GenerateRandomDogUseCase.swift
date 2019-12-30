//
//  GenerateRandomDogUseCase.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/29/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation

typealias GenerateDogUseCaseCompletionHandler = (_ result: ResultValue<RandomDog>, _ clientError: APIClientError) -> Void

protocol GenerateRandomDogUseCase {
    func generateDog(with request: APIRequest, completionHandler: @escaping GenerateDogUseCaseCompletionHandler)
}

// This class is used across all layers - Core, UI and Network
// It's not violating any dependency rules.
// However it might make sense for each layer do define it's own input parameters so it can be used independently of the other layers.

class GenerateRandomDogUseCaseImplementation {
    
    let generateDogGateway: GenerateDogGateway
    
    init(generateDogGateway: GenerateDogGateway) {
        self.generateDogGateway = generateDogGateway
    }
}

// MARK: - QSRViewUseCase

extension GenerateRandomDogUseCaseImplementation: GenerateRandomDogUseCase {
    func generateDog(with request: APIRequest, completionHandler: @escaping GenerateDogUseCaseCompletionHandler) {
        generateDogGateway.generateRandomDog(request: request, completionHandler: completionHandler)
    }
}
