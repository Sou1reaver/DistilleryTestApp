//
//  SearchVenuesRouter.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit



struct SearchVenuesRouter {

}


extension SearchVenuesRouter: SearchVenuesRouterInput {
    func openVenuesMapModule(from view: SearchVenuesViewInput?, with venues: [Venue]) {
        guard let module = VenuesMapModuleAssembly().assembleModule(withData: venues) else {
            print("Assemble search venues module error")
            return
        }
        let viewController = view as? UIViewController
        DispatchQueue.main.async {
            viewController?.present(module, animated: true, completion: nil)
        }
    }
    
    func openVenueDetailModule(from view: SearchVenuesViewInput?, with venue: Venue) {
        guard let module = VenueDetailModuleAssembly().assembleModule(withData: venue) else {
            print("Assemble search venues module error")
            return
        }
        let viewController = view as? UIViewController
        DispatchQueue.main.async {
            viewController?.navigationController?.pushViewController(module, animated: true)
        }
    }
}
