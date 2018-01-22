//
//  SearchVenuesInteractor.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


class SearchVenuesInteractor {
    private var radius: Int {
        return 1000
    }
    
    private lazy var locationService = createLocationService()
    private lazy var venueService: VenueServiceInput = VenueService()
    weak var output: SearchVenuesInteractorOutput?
    
    private func createLocationService() -> LocationServiceInput {
        let locationService = LocationService()
        locationService.output = self
        return locationService
    }
    
    private func getVenuesFor(coordinate: LocationCoordinate) {
        output?.didStartUpdateVenue()
        venueService.getVenuesFor(coordinate: coordinate,
                                  inRadius: radius,
                                  success: {[weak self] (venues) in
                                    self?.output?.didUpdateVenueList(venues: venues)
        },
                                  failure: { (error) in
                                    self.output?.venuesRequestDidFail(error)
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
    
    func locationServiceDidFailAuthorized() {
        output?.locationServiceDidFailAuthorized()
    }
}
