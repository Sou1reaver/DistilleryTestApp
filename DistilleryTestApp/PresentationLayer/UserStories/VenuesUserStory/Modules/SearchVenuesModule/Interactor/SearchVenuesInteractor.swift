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
    
    private var locationService: LocationServiceInput
    private let venueService: VenueServiceInput
    var output: SearchVenuesInteractorOutput? 
    
    init() {
        venueService = VenueService()
        locationService = LocationService()
        locationService.output = self
        locationService.requestAuthorization()
    }
    
    private func getVenuesFor(coordinate: LocationCoordinate) {
        venueService.getVenuesFor(coordinate: coordinate,
                                  inRadius: radius,
                                  completionHandler: { (venues) in
                                    self.output?.didUpdateVenueList(venues: venues)
        })
    }
    
}

extension SearchVenuesInteractor: SearchVenuesInteractorInput {
    func updateVenues() {
        locationService.start()
    }
}


// MARK: - LocationServiceOutput
extension SearchVenuesInteractor: LocationServiceOutput {
    func locationService(_ service: LocationService, didUpdateLocation coordinate: LocationCoordinate) {
        getVenuesFor(coordinate: coordinate)
        locationService.stop()
    }
}
