//
//  SearchVenueResponce.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 20.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation

struct SearchVenueResponce {
    var venues: [Venue]
}


extension SearchVenueResponce: Decodable {
    enum CodingKeys: CodingKey {
        case venues
    }
    
    enum ResponceCodingKeys: CodingKey {
        case response
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ResponceCodingKeys.self)
        let responce = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
        self.venues = try responce.decode([Venue].self, forKey: .venues)
    }
}
