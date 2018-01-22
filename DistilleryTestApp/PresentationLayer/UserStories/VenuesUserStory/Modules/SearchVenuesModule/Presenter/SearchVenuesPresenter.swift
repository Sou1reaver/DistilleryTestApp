//
//  SearchVenuesPresenter.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


class SearchVenuesPresenter {
    var router: SearchVenuesRouterInput?
    var interactor: SearchVenuesInteractorInput?
    weak var view: SearchVenuesViewInput?
}


extension SearchVenuesPresenter: SearchVenuesPresenterOutput {
    func setupView() {
        interactor?.updateVenues()
    }
}

// MARK: - SearchVenuesInteractorOutput
extension SearchVenuesPresenter: SearchVenuesInteractorOutput {
    func didStartUpdateVenue() {
        view?.showActivityIndicator()
    }
    
    func didUpdateVenueList(venues: [Venue]) {
        view?.removeActivityIndicator()
        view?.updateStateWithVenues(venues)
    }
    
    func venuesRequestDidFail(_ error: Error?) {
        view?.removeActivityIndicator()
    }
    
    func locationServiceDidFailAuthorized() {
        view?.showlocationServiceAuthorizedErrorAlert()
    }
    
    func didTapVenueCell(with venue: Venue) {
        router?.openVenueDetailModule(from: view, with: venue)
    }
}
