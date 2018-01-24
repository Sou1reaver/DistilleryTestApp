//
//  VenuesMapViewController.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit
import MapKit

class VenuesMapViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Properties
    var output: VenuesMapViewOutput?
    private var annotationId: String {
        return String(describing: VenueAnnotation.self)
    }
    
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.setupView()
    }
    
    
    // MARK: - Actions
    @IBAction func closeButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}


// MARK: - VenuesMapViewInput
extension VenuesMapViewController: VenuesMapViewInput {
    func updateStateWith(_ venueAnnotations: [VenueAnnotation]) {
        mapView.showAnnotations(venueAnnotations, animated: true)
    }
}


