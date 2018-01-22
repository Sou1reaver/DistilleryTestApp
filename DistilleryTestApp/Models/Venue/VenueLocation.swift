//
//  VenueLocation.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 20.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation

struct VenueLocation: Decodable {
    var lat: Double
    var lng: Double
    var country: String?
    var state: String?
    var city: String?
    var address: String?
    var distance: Int?
}
