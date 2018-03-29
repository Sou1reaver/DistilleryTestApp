//
//  VenueDetailCellBuilder.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation

class VenueDetailCellBuilder {
    func configureCell(_ cell: VenueDetailTableViewCell, with title: String) {
        cell.titleLabel.text = title
    }
}
