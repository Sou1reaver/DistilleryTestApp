//
//  SearchVenuesPresenter.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


class SearchVenuesPresenter {
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
    func didUpdateVenueList(venues: [Venue]) {
        view?.updateStateWithVenues(venues)
    }
    
}
