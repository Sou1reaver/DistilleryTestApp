//
//  VenuesMapInteractorOutput.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


protocol VenuesMapInteractorOutput: class {
    func locationDidUpdate(_ location: LocationCoordinate)
    func locationServiceDidFailAuthorized()
}
