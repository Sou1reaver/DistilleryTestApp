//
//  VenueDetailModuleAssembly.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit


class VenueDetailModuleAssembly {
    private var venuesStoryboard: UIStoryboard {
        return UIStoryboard(name: StoryboardNames.venues.rawValue, bundle: nil)
    }
    
    private var venueDetailViewController: VenueDetailViewController? {
        return venuesStoryboard.instantiateViewController(withIdentifier: String(describing: VenueDetailViewController.self)) as? VenueDetailViewController
    }
}


extension VenueDetailModuleAssembly: ModuleAssembly {
    typealias DestinationModuleData = Venue
    
    internal func assembleModule(withData data: DestinationModuleData?) -> UIViewController? {
        guard let venueDetailVC = venueDetailViewController else {
            print("ViewController with this identifier not found")
            return nil
        }
        
        let presenter = VenueDetailPresenter()
        if let venue = data {
            presenter.configureCurrentModule(with: venue)
        }
        presenter.view = venueDetailVC
        presenter.router = VenueDetailRouter()
        venueDetailVC.output = presenter
        
        return venueDetailVC
    }
}



