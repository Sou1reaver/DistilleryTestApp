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
    
    private var searchVenuesViewController: SearchVenuesViewController? {
        return venuesStoryboard.instantiateViewController(withIdentifier: String(describing: SearchVenuesViewController.self)) as? SearchVenuesViewController
    }
}


extension SearchVenuesModuleAssembly: ModuleAssembly {
    typealias DestinationModuleData = [Venue]
    
    internal func assembleModule(withData data: DestinationModuleData?) -> UIViewController? {
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
