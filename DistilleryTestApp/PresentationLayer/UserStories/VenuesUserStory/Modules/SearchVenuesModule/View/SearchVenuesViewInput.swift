//
//  SearchVenuesViewInput.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 21.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


protocol SearchVenuesViewInput: ActivityIndicatorViewProtocol {
    func updateStateWithVenues(_ venues: [Venue])
    func showlocationServiceAuthorizedErrorAlert()
}
