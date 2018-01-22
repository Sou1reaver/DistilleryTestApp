//
//  VenuesMapInteractor.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


class VenuesMapInteractor {
    private lazy var locationService = createLocationService()
    weak var output: VenuesMapInteractorOutput?
    
    private func createLocationService() -> LocationServiceInput {
        let locationService = LocationService()
        locationService.output = self
        return locationService
    }
}


extension VenuesMapInteractor: VenuesMapInteractorInput {
    func updateLocation() {
        locationService.start()
    }
}


// MARK: - LocationServiceOutput
extension VenuesMapInteractor: LocationServiceOutput {
    func locationService(_ service: LocationService, didUpdateLocation coordinate: LocationCoordinate) {
        output?.locationDidUpdate(coordinate)
        locationService.stop()
    }
    
    func locationServiceDidFailAuthorized() {
        output?.locationServiceDidFailAuthorized()
    }
}
