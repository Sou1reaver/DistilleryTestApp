//
//  VenueDetailViewController.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit
import AlamofireImage

class VenueDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var output: VenueDetailPresenterOutput?
    var venueDeails = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.setupView()
    }


}


// MARK: - SearchVenuesViewInput
extension VenueDetailViewController: VenueDetailViewInput {
    func updateStateWith(venueDeails: [String], imageUrl: String?) {
        self.venueDeails = venueDeails
        if let imageUrl = URL(string: ((imageUrl ?? ""))) {
            let imageView = UIImageView()
            imageView.af_setImage(withURL: imageUrl)
            tableView.tableHeaderView = UIImageView()
        }
        tableView.reloadData()
    }
}


// MARK: - UITableViewDataSource
extension VenueDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venueDeails.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = String.init(describing: VenueDetailTableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! VenueDetailTableViewCell
        VenueDetailCellBuilder().configureCell(cell, with: venueDeails[indexPath.row])
        return cell
    }
}
