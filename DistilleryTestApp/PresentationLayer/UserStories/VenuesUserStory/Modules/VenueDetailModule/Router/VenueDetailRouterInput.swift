//
//  VenueDetailRouterInput.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 23.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


protocol VenueDetailRouterInput {
    func openVenuesMapModule(from view: VenueDetailViewInput?, with venue: Venue)
}
