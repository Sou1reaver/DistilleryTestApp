//
//  SearchVenuesInteractorOutput.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


protocol SearchVenuesInteractorOutput: class {
    func didStartUpdateVenue()
    func didUpdateVenueList(venues: [Venue])
    func locationServiceDidFailAuthorized()
    func venuesRequestDidFail( _ error: Error?)
}
