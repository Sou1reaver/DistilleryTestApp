//
//  VenuesLaunchRouter.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit
import Swinject


struct VenuesLaunchRouter {
    private var venuesStoryboard: UIStoryboard {
        return UIStoryboard(name: StoryboardNames.venues.rawValue, bundle: nil)
    }
    
    private var searchVenuesViewController: ViewController? {
        return venuesStoryboard.instantiateViewController(withIdentifier: String(describing: ViewController.self)) as? ViewController
    }
    
    private var rootNavigationViewControler: UINavigationController? {
        let window = (UIApplication.shared.delegate as? AppDelegate)?.window
        return window?.rootViewController as? UINavigationController
    }
}


extension VenuesLaunchRouter: ModuleConfigurator {
    typealias ViewController = SearchVenuesViewController
    typealias DestinationModuleData = [Venue]
    
    internal func assembleModule(withData data: DestinationModuleData?) -> ViewController? {
        guard let searchVenuesVC = searchVenuesViewController else {
            print("ViewController with this identifier not found")
            return nil
        }
        
        
        let container = Container()
        container.register(SearchVenuesInteractor.self) { (r, presenter: SearchVenuesPresenter) in
            var interactor = SearchVenuesInteractor()
            interactor.output = presenter
            return interactor
        }
        
        
        container.register(SearchVenuesPresenter.self) { (r, view: SearchVenuesViewController) in
            var presenter = SearchVenuesPresenter()
            presenter.view = view
            presenter.interactor = container.resolve(SearchVenuesInteractor.self, argument: presenter)
            return presenter
        }
        
        searchVenuesVC.output = container.resolve(SearchVenuesPresenter.self, argument: searchVenuesVC)
        
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
