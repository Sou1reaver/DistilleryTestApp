//
//  LocationServiceInput.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 20.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


protocol LocationServiceInput {
    var output: LocationServiceOutput? {get set}
    func requestAuthorization()
    func start()
    func stop() 
}
