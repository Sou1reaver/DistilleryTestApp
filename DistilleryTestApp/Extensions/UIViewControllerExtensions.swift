//
//  UIViewControllerExtensions.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private func createLoadingView() -> UIView {
        let loadingView = UIView()
        loadingView.frame = view.bounds
        loadingView.backgroundColor = .black
        loadingView.alpha = 0.3
        
        let loadIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        loadingView.addSubview(loadIndicator)
        loadIndicator.center = view.center
        
        return loadingView
    }
    
    func show() {
        
    }
}
