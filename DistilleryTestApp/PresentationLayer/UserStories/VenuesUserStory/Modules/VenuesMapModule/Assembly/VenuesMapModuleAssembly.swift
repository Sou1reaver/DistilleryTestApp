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
    
    private var venuesMapViewController: VenuesMapViewController? {
        return venuesStoryboard.instantiateViewController(withIdentifier: String(describing: VenuesMapViewController.self)) as? VenuesMapViewController
    }
}


extension VenuesMapModuleAssembly: ModuleAssembly {
    typealias DestinationModuleData = [Venue]
    
    internal func assembleModule(withData data: DestinationModuleData?) -> UIViewController? {
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
        venuesMapVC.modalTransitionStyle = .flipHorizontal
        return venuesMapVC
    }
}
