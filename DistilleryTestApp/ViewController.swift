//
//  ViewController.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 20.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var locationService: LocationServiceInput = LocationService()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationService.output = self
        locationService.start()
    }


}


extension ViewController: LocationServiceOutput {
    func locationService(_ service: LocationService, didUpdateLocation coordinate: LocationCoordinate) {
        VenueService().getVenuesFor(coordinate: coordinate, inRadius: 100)
    }
}
