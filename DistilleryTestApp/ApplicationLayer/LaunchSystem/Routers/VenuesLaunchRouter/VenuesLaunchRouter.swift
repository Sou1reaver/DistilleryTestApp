//
//  VenuesLaunchRouter.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit


struct VenuesLaunchRouter {
    private var rootNavigationViewControler: UINavigationController? {
        let window = (UIApplication.shared.delegate as? AppDelegate)?.window
        return window?.rootViewController as? UINavigationController
    }
}


// MARK: - VenuesLaunchRouterInput
extension VenuesLaunchRouter: VenuesLaunchRouterInput {
    func openSearchVenuesModule() {
        guard let module = SearchVenuesModuleAssembly().assembleModule(withData: nil) else {
            print("Assemble search venues module error")
            return
        }
        DispatchQueue.main.async {
            self.rootNavigationViewControler?.setViewControllers([module], animated: false)
        }
        
    }
}
