//
//  AlertBuilder.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

struct AlertBuilder {
    func createInfoAlert(title: String) -> UIAlertController {
        let title = title
        let alertVC = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertVC.addAction(okAction)
        return alertVC
    }
}
