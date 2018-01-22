//
//  VenuesMapPresenter.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation

class VenuesMapPresenter {
    private var venues: [Venue]?
    weak var view: VenuesMapViewInput?
    var interactor: VenuesMapInteractorInput?
}


// MARK: - VenuesMapPresenterOutput
extension VenuesMapPresenter: VenuesMapPresenterOutput {
    func setupView() {
        interactor?.updateLocation()
        guard let venues = venues else { return }
        let annotations = VenueAnnotationFactory().getVenueAnnotations(from: venues)
        view?.updateStateWith(annotations)
    }
}


// MARK: - VenueDetailModuleInput
extension VenuesMapPresenter: VenuesMapModuleInput {
    func configureCurrentModule(with venues: [Venue]) {
        self.venues = venues
    }
}


// MARK: - SearchVenuesInteractorOutput
extension VenuesMapPresenter: VenuesMapInteractorOutput {
    func locationDidUpdate(_ location: LocationCoordinate) {
        view?.setRegionOnCoordinate(location)
    }

    func locationServiceDidFailAuthorized() {
        
    }
}
