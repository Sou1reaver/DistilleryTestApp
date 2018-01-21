//
//  ModuleConfigurator.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit


protocol ModuleConfigurator {
    associatedtype ViewController: UIViewController
    associatedtype DestinationModuleData
    weak var viewController: ViewController? {  get }
    func assembleModule(withData data: DestinationModuleData?) -> UIViewController?
}


