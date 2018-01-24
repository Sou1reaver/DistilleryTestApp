//
//  SearchVenuesViewOutput.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 24.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


protocol SearchVenuesViewOutput: class {
    func setupView()
    func didTapVenueCell(with venue: Venue)
    func didTapMapButton(with venues: [Venue])
}
