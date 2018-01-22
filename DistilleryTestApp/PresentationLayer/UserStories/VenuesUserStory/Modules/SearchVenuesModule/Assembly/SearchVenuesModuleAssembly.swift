//
//  SearchVenuesModuleAssembly.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit


struct SearchVenuesModuleAssembly {
    private var venuesStoryboard: UIStoryboard {
        return UIStoryboard(name: StoryboardNames.venues.rawValue, bundle: nil)
    }
    
    private var searchVenuesViewController: DestinationViewController? {
        return venuesStoryboard.instantiateViewController(withIdentifier: String(describing: DestinationViewController.self)) as? DestinationViewController
    }
}


extension SearchVenuesModuleAssembly: ModuleAssembly {
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
