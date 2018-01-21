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
    private let locationService: LocationServiceInput
    var output: SearchVenuesInteractorOutput?
    
    init() {
        locationService = LocationService()
        locationService.start()
    }
    

}

extension SearchVenuesInteractor: SearchVenuesInteractorInput {
    func updateVenues() {
        guard let coor = currentCoordinate else { return }
        VenueService().getVenuesFor(coordinate: coor,
                                    inRadius: radius,
                                    completionHandler: { (venues) in
                                        self.output?.didUpdateVenueList(venues: venues)
        })
    }
}


// MARK: - LocationServiceOutput
extension SearchVenuesInteractor: LocationServiceOutput {
    mutating func locationService(_ service: LocationService, didUpdateLocation coordinate: LocationCoordinate) {
        currentCoordinate = coordinate
    }
}
