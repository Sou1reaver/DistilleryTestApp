//
//  VenueDetailViewController.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

class VenueDetailViewController: UIViewController {
    
    var output: VenueDetailPresenterOutput?
    var venue: Venue!

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.setupView()
    }


}


// MARK: - SearchVenuesViewInput
extension VenueDetailViewController: VenueDetailViewInput {
    func updateStateWithVenue(_ venue: Venue) {
        self.venue = venue
    }
}
