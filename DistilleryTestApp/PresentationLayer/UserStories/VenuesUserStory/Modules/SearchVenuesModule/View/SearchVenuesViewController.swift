//
//  SearchVenuesViewController.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

class SearchVenuesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var output: SearchVenuesPresenterOutput?
    var venues = [Venue]()

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.setupView()
    }


}


// MARK: - SearchVenuesViewInput
extension SearchVenuesViewController: SearchVenuesViewInput {
    func updateStateWithVenues(_ venues: [Venue]) {
        self.venues = venues
        DispatchQueue.main.async {[weak self] in
            self?.tableView.reloadData()
        }
    }
}


// MARK: - UITableViewDataSource
extension SearchVenuesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = String.init(describing: SearchVenueTableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! SearchVenueTableViewCell
        SearchVenueCellBuilder().configureCell(cell, with: venues[indexPath.row])
        return cell
    }
}
