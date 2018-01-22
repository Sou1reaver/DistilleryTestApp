//
//  SearchVenuesPresenterOutput.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


protocol SearchVenuesPresenterOutput: class {
    func setupView()
    func didTapVenueCell(with venue: Venue)
    func didTapMapButton(with venues: [Venue])
}
