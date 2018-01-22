//
//  VenueAnnotationFactory.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import CoreLocation

struct VenueAnnotationFactory {
    func getVenueAnnotations(from venues: [Venue]) -> [VenueAnnotation] {
        let annotations = venues.flatMap { (venue) -> VenueAnnotation? in
            let coordinate = CLLocationCoordinate2D(latitude: venue.location.lat, longitude: venue.location.lng)
            return VenueAnnotation(title: venue.name, coordinate: coordinate)
        }
        return annotations
    }
}
