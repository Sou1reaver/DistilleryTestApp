//
//  VenuesLaunchRouter.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit


class VenuesLaunchRouter: BaseRouter {
    typealias SourceViewController = UINavigationController
}


// MARK: - VenuesLaunchRouterInput
extension VenuesLaunchRouter: VenuesLaunchRouterInput {
    func openSearchVenuesModule(with navigationController: UINavigationController) {
        let module = SearchVenuesModuleAssembly().assembleModule(withData: nil)
        openModule(module,
                   from: navigationController,
                   transitionClosure: { (source, destination) in
                    source.setViewControllers([destination], animated: false)
        })        
    }
}


