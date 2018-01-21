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
    
    private var searchVenuesViewController: ViewController? {
        return venuesStoryboard.instantiateViewController(withIdentifier: String(describing: ViewController.self)) as? ViewController
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
        
        var presenter = SearchVenuesPresenter()
        var interactor = SearchVenuesInteractor()
        
        presenter.interactor = interactor
        interactor.output = presenter
        searchVenuesVC.output = presenter
        
        return searchVenuesVC
    }
}



extension VenuesLaunchRouter: VenuesLaunchRouterInput {
    func openSearchVenuesModule() {
        let window = (UIApplication.shared.delegate as? AppDelegate)?.window
        window?.rootViewController = assembleModule(withData: nil)
        window?.makeKeyAndVisible()
    }
}
