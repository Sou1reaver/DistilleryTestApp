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
    var output: VenuesMapPresenterOutput?
    var venueAnnotations = [VenueAnnotation]()
    private var annotationId: String {
        return String(describing: VenueAnnotation.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}


// MARK: - VenuesMapViewInput
extension VenuesMapViewController: VenuesMapViewInput {
    func updateStateWith(_ venueAnnotations: [VenueAnnotation]) {
        mapView.addAnnotations(venueAnnotations)
        mapView.reloadInputViews()
    }
    
    
}


// MARK: - MKMapViewDelegate
extension VenuesMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var view : MKPinAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationId) as? MKPinAnnotationView {
            view = dequeuedView
        } else { 
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationId)
        }
        return view
    }
}
