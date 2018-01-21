//
//  ModuleConfigurator.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit


protocol ModuleConfigurator {
    associatedtype ViewController
    associatedtype DestinationModuleData
    func assembleModule(withData data: DestinationModuleData?) -> ViewController?
}


