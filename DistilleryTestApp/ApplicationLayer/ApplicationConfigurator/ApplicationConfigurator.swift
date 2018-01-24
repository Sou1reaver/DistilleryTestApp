//
//  ApplicationConfigurator.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 20.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

protocol ApplicationConfiguratorInput {
    func configureInitialSettings(withRoot viewController: UIViewController?)
}

class ApplicationConfigurator {
    private lazy var router: VenuesLaunchRouterInput = VenuesLaunchRouter()
}


// MARK: - ApplicationConfiguratorInput
extension ApplicationConfigurator: ApplicationConfiguratorInput {
    func configureInitialSettings(withRoot viewController: UIViewController?)  {
        guard let navigationController = viewController as? UINavigationController else {
            print("Root View Controller must be UINavigationController")
            return
        }
        router.openSearchVenuesModule(with: navigationController)
    }
}
