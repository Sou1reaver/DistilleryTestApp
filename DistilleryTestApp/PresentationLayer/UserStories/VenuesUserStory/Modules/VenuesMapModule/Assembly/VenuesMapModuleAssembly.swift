//
//  VenuesMapModuleAssembly.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

struct VenuesMapModuleAssembly {
    private var venuesStoryboard: UIStoryboard {
        return UIStoryboard(name: StoryboardNames.venues.rawValue, bundle: nil)
    }
    
    private var venuesMapViewController: DestinationViewController? {
        return venuesStoryboard.instantiateViewController(withIdentifier: String(describing: DestinationViewController.self)) as? DestinationViewController
    }
}


extension VenuesMapModuleAssembly: ModuleAssembly {
    typealias DestinationViewController = VenuesMapViewController
    typealias DestinationModuleData = [Venue]
    
    internal func assembleModule(withData data: DestinationModuleData?) -> DestinationViewController? {
        guard let venuesMapVC = venuesMapViewController else {
            print("ViewController with this identifier not found")
            return nil
        }
        
        let presenter = VenuesMapPresenter()
        if let venues = data {
            presenter.configureCurrentModule(with: venues)
        }
        presenter.view = venuesMapVC
        venuesMapVC.output = presenter
        
        return venuesMapVC
    }
}
