//
//  VenuesLaunchRouter.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit


struct VenuesLaunchRouter: BaseRouter {
    typealias SourceViewController = UINavigationController
    private var rootNavigationViewControler: SourceViewController? {
        let window = (UIApplication.shared.delegate as? AppDelegate)?.window
        return window?.rootViewController as? SourceViewController
    }
}


// MARK: - VenuesLaunchRouterInput
extension VenuesLaunchRouter: VenuesLaunchRouterInput {
    func openSearchVenuesModule() {
        let module = SearchVenuesModuleAssembly().assembleModule(withData: nil)
        openModule(module,
                   from: rootNavigationViewControler,
                   transitionClosure: { (source, destination) in
                    source.setViewControllers([destination], animated: false)
        })        
    }
}


