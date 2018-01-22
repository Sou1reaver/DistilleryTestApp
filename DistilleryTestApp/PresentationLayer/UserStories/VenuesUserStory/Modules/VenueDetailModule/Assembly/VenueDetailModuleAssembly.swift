//
//  VenueDetailModuleAssembly.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit


struct VenueDetailModuleAssembly {
    private var venuesStoryboard: UIStoryboard {
        return UIStoryboard(name: StoryboardNames.venues.rawValue, bundle: nil)
    }
    
    private var venueDetailViewController: DestinationViewController? {
        return venuesStoryboard.instantiateViewController(withIdentifier: String(describing: DestinationViewController.self)) as? DestinationViewController
    }
}


extension VenueDetailModuleAssembly: ModuleAssembly {
    typealias DestinationViewController = VenueDetailViewController
    typealias DestinationModuleData = Venue
    
    internal func assembleModule(withData data: DestinationModuleData?) -> DestinationViewController? {
        guard let venueDetailVC = venueDetailViewController else {
            print("ViewController with this identifier not found")
            return nil
        }
        
        let presenter = VenueDetailPresenter()
        if let venue = data {
            presenter.configureCurrentModule(with: venue)
        }
        presenter.view = venueDetailVC
        venueDetailVC.output = presenter
        
        return venueDetailVC
    }
}



