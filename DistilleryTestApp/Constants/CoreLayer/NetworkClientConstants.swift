//
//  NetworkClientConstants.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 20.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


enum NetworkClientConstants: String {
    case clientIdKey = "client_id"
    case clientIdValue = "MSKPCVKLEEWJZR3SO1JN3VXOKEKZNJUH00ZSWS1N4JBPQXIS"
    
    case clientSecretKey = "client_secret"
    case clientSecretValue = "DN4P4OG1K05AB3NF2L2USWMDBGMET4BYGBJDMZTACRTG3XWZ"
    
    case versionKey = "v"
    //date in YYYYMMDD, when app prepared for API changes
    case versionValue = "20180120"
}
