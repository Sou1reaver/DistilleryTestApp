//
//  SearchVenuesViewController.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

class SearchVenuesViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapButton: UIBarButtonItem!
    
    // MARK: - Properties
    var output: SearchVenuesPresenterOutput?
    var venues = [Venue]()
    
    // MARK: - Life circle
    override func viewDidLoad() {
        super.viewDidLoad()

        output?.setupView()
    }
    
    
    // MARK: - Actions
    @IBAction func mapButtonDidTap(_ sender: UIBarButtonItem) {
        output?.didTapMapButton(with: venues)
    }
    
    // MARK: - Private methods
    
}


// MARK: - SearchVenuesViewInput
extension SearchVenuesViewController: SearchVenuesViewInput {
    func updateStateWithVenues(_ venues: [Venue]) {
        self.venues = venues
        DispatchQueue.main.async {[weak self] in
            self?.mapButton.isEnabled = !venues.isEmpty
            self?.tableView.reloadData()
        }
    }
    
    func showlocationServiceAuthorizedErrorAlert() {
        let title = "Open access to the geoposition for Test App, for showing venues near you"
        let alert = AlertBuilder().createInfoAlert(title: title)
        present(alert, animated: true, completion: nil)
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


extension SearchVenuesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output?.didTapVenueCell(with: venues[indexPath.row])
    }
}








