//
//  NetworkClientInput.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 20.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


protocol NetworkClientInput {
    func sendRequest(url: String,
                     method: HTTPMethod,
                     parameters: Parameters?,
                     enconding: URLEncoding,
                     headers: HTTPHeaders?)
}
