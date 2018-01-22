//
//  VenueServiceInput.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 20.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation
import CoreLocation


protocol VenueServiceInput {
    func getVenuesFor(coordinate: LocationCoordinate,
                      inRadius radius: Int,
                      success: ((_ venues: [Venue]) -> Void)?,
                      failure: ((_ error: Error?) -> Void)?)
}
