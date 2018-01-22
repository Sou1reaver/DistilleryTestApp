//
//  VenuesLaunchRouter.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit


struct VenuesLaunchRouter {
    private var venuesStoryboard: UIStoryboard {
        return UIStoryboard(name: StoryboardNames.venues.rawValue, bundle: nil)
    }
    
    private var searchVenuesViewController: DestinationViewController? {
        return venuesStoryboard.instantiateViewController(withIdentifier: String(describing: DestinationViewController.self)) as? DestinationViewController
    }
    
    private var rootNavigationViewControler: UINavigationController? {
        let window = (UIApplication.shared.delegate as? AppDelegate)?.window
        return window?.rootViewController as? UINavigationController
    }
}


extension VenuesLaunchRouter: ModuleConfigurator {
    typealias DestinationViewController = SearchVenuesViewController
    typealias DestinationModuleData = [Venue]
    
    internal func assembleModule(withData data: DestinationModuleData?) -> DestinationViewController? {
        guard let searchVenuesVC = searchVenuesViewController else {
            print("ViewController with this identifier not found")
            return nil
        }
        
        let presenter = SearchVenuesPresenter()
        let interactor = SearchVenuesInteractor()
        
        interactor.output = presenter
        presenter.view = searchVenuesVC
        presenter.router = SearchVenuesRouter()
        presenter.interactor = interactor
        searchVenuesVC.output = presenter
        
        return searchVenuesVC
    }
}



extension VenuesLaunchRouter: VenuesLaunchRouterInput {
    func openSearchVenuesModule() {
        guard let module = assembleModule(withData: nil) else {
            print("Assemble search venues module error")
            return
        }
        DispatchQueue.main.async {
            self.rootNavigationViewControler?.setViewControllers([module], animated: false)
        }
        
    }
}
