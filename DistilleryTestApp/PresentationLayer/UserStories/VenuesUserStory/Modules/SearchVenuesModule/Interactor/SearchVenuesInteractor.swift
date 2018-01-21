//
//  SearchVenuesInteractor.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


struct SearchVenuesInteractor {
    private var radius: Int {
        return 1000
    }
    private var currentCoordinate: LocationCoordinate?
    private var locationService: LocationServiceInput
    private let venueService: VenueServiceInput
    var output: SearchVenuesInteractorOutput? 
    
    init() {
        venueService = VenueService()
        locationService = LocationService()
        locationService.output = self
        locationService.requestAuthorization()
        locationService.start()
    }
    
}

extension SearchVenuesInteractor: SearchVenuesInteractorInput {
    func updateVenues() {
        guard let coor = locationService.lastCoordinate else { return }
        venueService.getVenuesFor(coordinate: coor,
                                  inRadius: radius,
                                  completionHandler: { (venues) in
                                    self.output?.didUpdateVenueList(venues: venues)
        })
    }
}


// MARK: - LocationServiceOutput
extension SearchVenuesInteractor: LocationServiceOutput {
    func locationService(_ service: LocationService, didUpdateLocation coordinate: LocationCoordinate) {
       
    }
}
