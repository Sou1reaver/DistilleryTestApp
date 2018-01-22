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
    
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMapView()
        output?.setupView()
    }
    
    
    // MARK: - Actions
    @IBAction func closeButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - private methods
    func configureMapView() {
        mapView.userTrackingMode = .follow
    }
}


// MARK: - VenuesMapViewInput
extension VenuesMapViewController: VenuesMapViewInput {
    func updateStateWith(_ venueAnnotations: [VenueAnnotation]) {
        mapView.addAnnotations(venueAnnotations)
        DispatchQueue.main.async { [weak self] in
            self?.mapView.reloadInputViews()
        }
    }
}


// MARK: - MKMapViewDelegate
extension VenuesMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var view : MKPinAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationId) as? MKPinAnnotationView {
            view = dequeuedView
            view.annotation = annotation
        } else { 
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationId)
        }
        return view
    }
}
