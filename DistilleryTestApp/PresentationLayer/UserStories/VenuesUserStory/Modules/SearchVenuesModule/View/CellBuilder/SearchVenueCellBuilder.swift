//
//  SearchVenueCellBuilder.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


class SearchVenueCellBuilder {
    func configureCell(_ cell: SearchVenueTableViewCell, with venue: Venue) {
        cell.titleLabel.text = venue.name
        cell.categoryTitleLabel.text = venue.primaryCategory?.name
        if let distance = venue.location.distance {
            cell.distanceLabel.text = "\(distance) m"
        }
    }
}
