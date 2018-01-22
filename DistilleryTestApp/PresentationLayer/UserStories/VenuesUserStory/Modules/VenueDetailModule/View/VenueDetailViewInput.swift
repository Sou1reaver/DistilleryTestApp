//
//  VenueDetailViewInput.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


protocol VenueDetailViewInput: class {
    func updateStateWithVenue(_ venue: Venue)
}
