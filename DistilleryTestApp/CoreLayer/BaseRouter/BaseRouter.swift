//
//  BaseRouter.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 23.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit


protocol BaseRouter {
    associatedtype SourceViewController
}

extension BaseRouter {
    func openModule(_ module: UIViewController?,
                    from viewController: SourceViewController?,
                    transitionClosure: (_ source: SourceViewController, _ destination: UIViewController) -> Void) {
        
        guard let `module` = module else {
            print("BaseRouter Error: Assemble search venues module error")
            return
        }
        guard let sourceVC = viewController else {
            print("BaseRouter Error: source view contoller is nil")
            return
        }
        transitionClosure(sourceVC, module)
    }
}
