//
//  LocationServiceOutput.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 20.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationServiceOutput: class {
    func locationService(_ service: LocationService, didUpdateLocation coordinate: LocationCoordinate)
    func locationServiceDidFailAuthorized()
}
