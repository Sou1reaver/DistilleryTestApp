//
//  VenueDetailPresenter.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


class VenueDetailPresenter {
    private var venue: Venue?
    var router: VenueDetailRouterInput?
    weak var view: VenueDetailViewInput?
    
    private func getVenueDetails(_ venue: Venue) -> [String] {
        var details = [venue.name]
        if let categoryName = venue.primaryCategory?.name {
            details.append(categoryName)
        }
        if let city = venue.location.city {
           details.append(city)
        }
        if let address = venue.location.address {
            details.append(address)
        }
        
        return details
    }
}


// MARK: - VenueDetailPresenterOutput
extension VenueDetailPresenter: VenueDetailPresenterOutput {
    func setupView() {
        guard let `venue` = venue else { return }
        let venueDeails = getVenueDetails(venue)
        view?.updateStateWith(venueDeails: venueDeails, imageUrl: venue.primaryCategory?.iconUrl)
    }
    
    func didTapMapButton() {
        guard let `venue` = venue else { return }
        router?.openVenuesMapModule(from: view, with: venue)
    }
}

// MARK: - VenueDetailModuleInput
extension VenueDetailPresenter: VenueDetailModuleInput {
    func configureCurrentModule(with venue: Venue) {
        self.venue = venue
    }
}


