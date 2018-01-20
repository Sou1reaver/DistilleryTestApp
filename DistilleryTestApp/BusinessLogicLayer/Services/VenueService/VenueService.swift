//
//  VenueService.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 20.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation
import Alamofire

struct VenueService {
    private let networkClient: NetworkClientInput
    private var venuesSearchUrl: String {
        return  VenueServiceUrlConstants.baseUrl.rawValue +
                VenueServiceUrlConstants.venuesSearchPath.rawValue
    }
    
    init() {
        self.networkClient = NetworkClient()
    }
    
    private func generateParameters(radius: Int, coordinate: LocationCoordinate) -> [String:Any] {
        let locationKey = VenueServiceApiKeys.locationKey.rawValue
        let radiusKey = VenueServiceApiKeys.radiusKey.rawValue
        
        let params = [locationKey:"\(coordinate.latitude), \(coordinate.longitude)",
                      radiusKey:String(radius)]
        return params
    }
}



extension VenueService: VenueServiceInput {
    
    func getVenuesFor(coordinate: LocationCoordinate, inRadius radius: Int) {
        let parameters = generateParameters(radius: radius, coordinate: coordinate)
        
        networkClient.sendRequest(url: venuesSearchUrl,
                                  method: .get,
                                  parameters: parameters,
                                  enconding: URLEncoding.default,
                                  headers: nil,
                                  completionHandler: { (data, error) in
 
                                    do {
                                        let searchVenueResponce = try JSONDecoder().decode(SearchVenueResponce.self, from: data!)
                                        
                                    } catch let error {
                                        print(error.localizedDescription)
                                    }
        })
    }
}
