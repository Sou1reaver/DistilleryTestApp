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


// MARK: - SearchVenuesPresenterOutput
extension SearchVenuesPresenter: SearchVenuesViewOutput {
    func setupView() {
        interactor?.updateVenues()
    }
    
    func didTapVenueCell(with venue: Venue) {
        router?.openVenueDetailModule(from: view, with: venue)
    }
    
    func didTapMapButton(with venues: [Venue]) {
        router?.openVenuesMapModule(from: view, with: venues)
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
}



