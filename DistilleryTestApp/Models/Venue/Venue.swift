//
//  Venue.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 20.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


struct Venue: Decodable {
    var name: String
    var location: VenueLocation
    var categories: [VenueCategory]
}
