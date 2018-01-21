//
//  LocationService.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 20.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation
import CoreLocation


class LocationService: NSObject {
    private lazy var manager = createManager()
    var output: LocationServiceOutput?
    var lastCoordinate: LocationCoordinate?
    
    private func createManager() -> CLLocationManager {
        let manager  = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        return manager
    }
}


//MARK: - LocationServiceInput
extension LocationService: LocationServiceInput {
    func requestAuthorization() {
        self.manager.requestWhenInUseAuthorization()
    }
    
    func start() {
        self.manager.startUpdatingLocation()
    }
    
    func stop() {
        manager.stopUpdatingLocation()
    }
}


//MARK: - CLLocationManagerDelegate
extension LocationService: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.last, currentLocation.horizontalAccuracy >= 0 {
            let coordinate = LocationCoordinate(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
            lastCoordinate = coordinate
            output?.locationService(self, didUpdateLocation: coordinate)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
}



