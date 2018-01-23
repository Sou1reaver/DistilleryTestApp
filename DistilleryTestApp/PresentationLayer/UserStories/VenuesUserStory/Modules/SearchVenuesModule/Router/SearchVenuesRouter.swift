//
//  SearchVenuesRouter.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit



struct SearchVenuesRouter: BaseRouter {
    typealias SourceViewController = UIViewController
}


// MARK: - SearchVenuesRouterInput
extension SearchVenuesRouter: SearchVenuesRouterInput {
    func openVenuesMapModule(from view: SearchVenuesViewInput?, with venues: [Venue]) {
        let viewController = view as? UIViewController
        let module = VenuesMapModuleAssembly().assembleModule(withData: venues)
        openModule(module,
                   from: viewController,
                   transitionClosure: { (source, destination) in
                    source.present(destination, animated: true, completion: nil)
        })
    }
    
    func openVenueDetailModule(from view: SearchVenuesViewInput?, with venue: Venue) {
        let viewController = view as? UIViewController
        let module = VenueDetailModuleAssembly().assembleModule(withData: venue)
        openModule(module,
                   from: viewController,
                   transitionClosure: { (source, destination) in
                    source.navigationController?.pushViewController(destination, animated: true)
        })
    }
}
