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
    
    private func generateDefaultParams() -> Parameters {
        let clientIdKey = NetworkClientConstants.clientIdKey.rawValue
        let clientIdValue = NetworkClientConstants.clientIdValue.rawValue
        
        let clientSecretKey = NetworkClientConstants.clientSecretKey.rawValue
        let clientSecretValue = NetworkClientConstants.clientSecretValue.rawValue
        
        let versionKey = NetworkClientConstants.versionKey.rawValue
        let versionValue = NetworkClientConstants.versionValue.rawValue
        
        let params: Parameters = [clientIdKey:clientIdValue,
                                 clientSecretKey:clientSecretValue,
                                 versionKey:versionValue]
        return params
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
        
        var params = generateDefaultParams()
        if let inputParams = parameters {
            params.merge(inputParams, uniquingKeysWith: {$1})
        }
        
        Alamofire.request(url,
                          method: method,
                          parameters: params,
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
