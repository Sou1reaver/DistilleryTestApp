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
    weak var view: VenueDetailViewInput?
}



extension VenueDetailPresenter: VenueDetailPresenterOutput {
    func setupView() {
        guard let `venue` = venue else { return }
        view?.updateStateWithVenue(venue)
    }
}

// MARK: - VenueDetailModuleInput
extension VenueDetailPresenter: VenueDetailModuleInput {
    func configureCurrentModuleWithVenue(_ venue: Venue) {
        self.venue = venue
    }
}


