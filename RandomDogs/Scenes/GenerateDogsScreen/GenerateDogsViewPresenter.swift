//
//  GenerateDogsViewPresenter.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/28/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation
import Alamofire

protocol GenerateDogsView {
    func showDog(withUrl url: String)
}

protocol GenerateDogsViewPresenter {
    var router: GenerateDogsViewRouter { get }
    func generateRandomDog()
}

class GenerateDogsViewPresenterImplementation {
    
    fileprivate var view: GenerateDogsView
    fileprivate var useCase: GenerateRandomDogUseCase
    private(set) var router: GenerateDogsViewRouter
    
    init(view: GenerateDogsView, router: GenerateDogsViewRouter, useCase: GenerateRandomDogUseCase) {
        self.router = router
        self.useCase = useCase
        self.view = view
    }
}

extension GenerateDogsViewPresenterImplementation: GenerateDogsViewPresenter {
    func generateRandomDog() {
        useCase.generateDog(with: GenerateDogApiRequst()) { (result: ResultValue<RandomDog>, error: APIClientError) in
            switch result {
            case .success(let randomDog):
                if let status = randomDog.status, let message = randomDog.message, status == "success" {
                    self.view.showDog(withUrl: message)
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}

private struct GenerateDogApiRequst: APIRequest {
    var url: String {
        return "https://dog.ceo/api/breeds/image/random"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters {
        return [:]
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var headers: HTTPHeaders {
        return [:]
    }
}
