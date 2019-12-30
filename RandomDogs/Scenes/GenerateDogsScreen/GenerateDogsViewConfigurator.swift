//
//  GenerateDogsViewConfigurator.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/28/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation
protocol GenerateDogsViewConfigurator {
    func configure(viewController: GenerateDogsViewController)
}

class GenerateDogsViewConfiguratorImplementation: GenerateDogsViewConfigurator {
    func configure(viewController: GenerateDogsViewController) {
        let client = APIRequestClientImplementation()
        let gateway = ApiGenerateDogGatewayImplementation(client: client)
        let usecase = GenerateRandomDogUseCaseImplementation(generateDogGateway: gateway)
        let router = GenerateDogsViewRouterImplementation(generateDogsViewController: viewController)
        let presenter = GenerateDogsViewPresenterImplementation(view: viewController, router: router, useCase: usecase)
        viewController.presenter = presenter
    }
}
