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
    
    // MARK: - Outlets
    @IBOutlet weak var venueCategoryImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var tableViewHeaderHeight: CGFloat {
        return 240
    }
    var output: VenueDetailViewOutput?
    private var venueDeails = [String]()
    private lazy var venueDetailCellBuilder = VenueDetailCellBuilder()
    private let venueDetailTableViewCellId = String(describing: VenueDetailTableViewCell.self)
    
    
    // MARK: - Life circle
    override func viewDidLoad() {
        super.viewDidLoad()

        output?.setupView()
    }
    
    
    // MARK: - Private methods
    private func confgiureTableViewHeader(with imageUrl: String?) {
        if let imageUrl = URL(string: ((imageUrl ?? ""))) {
            venueCategoryImageView.af_setImage(withURL: imageUrl)
            venueCategoryImageView.frame.size.height = tableViewHeaderHeight
        } else {
            venueCategoryImageView.frame.size.height = 0
        }
    }
    
    
    // MARK: - Actions
    @IBAction func mapButtonDidTap(_ sender: UIBarButtonItem) {
        output?.didTapMapButton()
    }
}


// MARK: - SearchVenuesViewInput
extension VenueDetailViewController: VenueDetailViewInput {
    func updateStateWith(venueDeails: [String], imageUrl: String?) {
        self.venueDeails = venueDeails
        confgiureTableViewHeader(with: imageUrl)
        tableView.reloadData()
    }
}


// MARK: - UITableViewDataSource
extension VenueDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venueDeails.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: venueDetailTableViewCellId, for: indexPath) as! VenueDetailTableViewCell
        venueDetailCellBuilder.configureCell(cell, with: venueDeails[indexPath.row])
        return cell
    }
}
