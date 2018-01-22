//
//  VenueCategory.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 20.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


struct VenueCategory: Decodable {
    var id: String
    var name: String
    var shortName: String?
    var isPrimary: Bool?
    private var foursquareIcon: FoursquareIcon?
    var iconUrl: String {
        return (foursquareIcon?.prefix ?? "")+"88"+(foursquareIcon?.suffix ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case shortName = "shortName"
        case isPrimary = "primary"
        case foursquareIcon = "icon"
    }
}



