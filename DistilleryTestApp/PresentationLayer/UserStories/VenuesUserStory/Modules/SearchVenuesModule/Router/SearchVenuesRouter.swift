//
//  SearchVenuesRouter.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit



struct SearchVenuesRouter {
    private var venuesStoryboard: UIStoryboard {
        return UIStoryboard(name: StoryboardNames.venues.rawValue, bundle: nil)
    }
    
    private var venueDetailViewController: DestinationViewController? {
        return venuesStoryboard.instantiateViewController(withIdentifier: String(describing: DestinationViewController.self)) as? DestinationViewController
    }
}


extension SearchVenuesRouter: ModuleConfigurator {
    typealias DestinationViewController = VenueDetailViewController
    typealias DestinationModuleData = Venue
    
    internal func assembleModule(withData data: DestinationModuleData?) -> DestinationViewController? {
        guard let venueDetailVC = venueDetailViewController else {
            print("ViewController with this identifier not found")
            return nil
        }
        
        let presenter = VenueDetailPresenter()
        if let venue = data {
            presenter.configureCurrentModuleWithVenue(venue)
        }
        presenter.view = venueDetailVC
        venueDetailVC.output = presenter
        
        return venueDetailVC
    }
}




extension SearchVenuesRouter: SearchVenuesRouterInput {
    func openVenueDetailModule(from view: SearchVenuesViewInput?, with venue: Venue) {
        guard let module = assembleModule(withData: venue) else {
            print("Assemble search venues module error")
            return
        }
        let viewController = view as? UIViewController
        DispatchQueue.main.async {
            viewController?.navigationController?.pushViewController(module, animated: true)
        }
    }
}
