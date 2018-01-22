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

        output?.setupView()
    }
    
    
    // MARK: - Actions
    @IBAction func closeButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MAR: - private methods
    private func centerMapOnCoordinate(_ coordinate: CLLocationCoordinate2D, withAnimation: Bool) {
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        var deltaPoint = mapView.convert(location.coordinate, toPointTo: mapView)
        deltaPoint.y += mapView.bounds.height*0.35
        let newCoor = mapView.convert(deltaPoint, toCoordinateFrom: mapView)
        mapView.setCenter(newCoor, animated: withAnimation)
    }
    
}


// MARK: - VenuesMapViewInput
extension VenuesMapViewController: VenuesMapViewInput {
    func updateStateWith(_ venueAnnotations: [VenueAnnotation]) {
        mapView.addAnnotations(venueAnnotations)
        mapView.reloadInputViews()
    }
    
    func setRegionOnCoordinate(_ locationCoordinate: LocationCoordinate) {
        let regionRadius = 1000.0
        let coordinate = CLLocationCoordinate2D(latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinate,
                                                                  regionRadius * 2.0,
                                                                  regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: false)
        centerMapOnCoordinate(coordinate, withAnimation: true)
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
