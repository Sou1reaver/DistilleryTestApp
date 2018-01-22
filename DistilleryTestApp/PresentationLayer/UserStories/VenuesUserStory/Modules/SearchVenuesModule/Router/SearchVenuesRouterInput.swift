//
//  SearchVenuesRouterInput.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit


protocol SearchVenuesRouterInput {
    func openVenueDetailModule(from view: SearchVenuesViewInput?, with venue: Venue)
    func openVenuesMapModule(from view: SearchVenuesViewInput?, with venues: [Venue])
}
