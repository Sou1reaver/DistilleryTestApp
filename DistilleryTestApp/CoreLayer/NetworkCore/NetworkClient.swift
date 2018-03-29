//
//  NetworkClient.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 20.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation
import Alamofire


class NetworkClient {
    private var responceQueue: DispatchQueue {
        return DispatchQueue(label: "response-queue", qos: .utility, attributes: [.concurrent])
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
                     success: ((_ data: Data) -> Void)?,
                     failure: ((_ error: Error) -> Void)?) {
        
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
           
            .responseJSON(queue: responceQueue,
                          options: JSONSerialization.ReadingOptions.allowFragments,
                          completionHandler: { (responce) in
                            if let data = responce.data {
                                success?(data)
                            }
                            if let error = responce.result.error {
                                print("Error: \(error)")
                            }
            })
    }
}
