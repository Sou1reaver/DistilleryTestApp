//
//  ApplicationConfigurator.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 20.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation


struct ApplicationConfigurator {
    
    private let venuesLaunchRouter: VenuesLaunchRouterInput = VenuesLaunchRouter()
    private func checkPermissions() {
        DispatchQueue.main.async {
            LocationService().requestAuthorization()
        }
    }
    
    func openInitialModule() {
        venuesLaunchRouter.openSearchVenuesModule()
    }
    
    func configureInitialSettings() {
        checkPermissions()
        openInitialModule()
    }
}
