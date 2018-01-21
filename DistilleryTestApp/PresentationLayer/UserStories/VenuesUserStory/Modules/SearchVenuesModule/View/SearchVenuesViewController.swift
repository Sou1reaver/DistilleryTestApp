//
//  SearchVenuesViewController.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

class SearchVenuesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}


extension SearchVenuesViewController: SearchVenuesViewInput {
    func updateStateWithVenues(_ venues: [Venue]) {
        
    }
}
