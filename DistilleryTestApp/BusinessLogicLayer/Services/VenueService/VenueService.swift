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
    
    private func generateParameters(radius: Int) -> [String:Any] {
        let locationKey = VenueServiceApiKeys.locationKey.rawValue
        let radiusKey = VenueServiceApiKeys.radiusKey.rawValue
        
        let params = [locationKey:"44.23, -43.654",
                      radiusKey:String(radius)]
        return params
    }
}



extension VenueService: VenueServiceInput {
    
    func getVenuesInRadius(_ radius: Int) {
        let parameters = generateParameters(radius: radius)
        
        networkClient.sendRequest(url: venuesSearchUrl,
                                  method: .get,
                                  parameters: parameters,
                                  enconding: URLEncoding.default,
                                  headers: nil,
                                  completionHandler: { (data, error) in
                                    let str = String.init(data: data!, encoding: String.Encoding.utf8)
                                    print(str)
        })
    }
}
