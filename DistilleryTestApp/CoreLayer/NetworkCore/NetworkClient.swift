//
//  NetworkClient.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 20.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation
import Alamofire


struct NetworkClient {
    private var responceQueue: DispatchQueue {
        return DispatchQueue.global()
    }
    private var baseUrl: String {
        return NetworkClientConstants.baseUrl.rawValue
    }
}


// MARK: - NetworkClientInput
extension NetworkClient: NetworkClientInput {
    func sendRequest(url: String,
                     method: HTTPMethod,
                     parameters: Parameters?,
                     enconding: URLEncoding,
                     headers: HTTPHeaders?,
                     completionHandler: ((_ success: Data?, _ failure: Error?) -> Void)?) {
        
        guard let url = URL(string: url) else {
            print("Invalid url")
            return
        }
        Alamofire.request(url,
                          method: method,
                          parameters: parameters,
                          encoding: enconding,
                          headers: headers)
            
            .responseData(queue: responceQueue,
                          completionHandler: { (responce) in
                            completionHandler?(responce.result.value, responce.result.error)
                            if responce.result.error != nil {
                                print("Error: \(responce.result.error!)")
                            }
            })
    }
}
