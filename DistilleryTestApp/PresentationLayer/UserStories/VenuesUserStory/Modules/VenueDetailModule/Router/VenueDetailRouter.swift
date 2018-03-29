//
//  VenueDetailRouter.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 23.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

class VenueDetailRouter: BaseRouter {
    typealias SourceViewController = UIViewController
}


// MARK: - VenueDetailRouterInput
extension VenueDetailRouter: VenueDetailRouterInput {
    func openVenuesMapModule(from view: VenueDetailViewInput?, with venue: Venue) {
        let viewController = view as? UIViewController
        let module = VenuesMapModuleAssembly().assembleModule(withData: [venue])
        openModule(module,
                   from: viewController,
                   transitionClosure: { (source, destination) in
                    source.present(destination, animated: true, completion: nil)
        })
    }
}
