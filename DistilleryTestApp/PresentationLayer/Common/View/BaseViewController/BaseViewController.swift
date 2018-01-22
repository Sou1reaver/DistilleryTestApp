//
//  BaseViewController.swift
//  DistilleryTestApp
//
//  Created by Vladimir Gordienko on 22.01.18.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

protocol ActivityIndicatorViewProtocol: class {
    func showActivityIndicator()
    func removeActivityIndicator()
}

class BaseViewController: UIViewController {
    
    private lazy var activityIndicatorView = createActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - private methods
    private func createActivityIndicatorView() -> UIView {
        let activityIndicatorView = UIView()
        activityIndicatorView.frame = view.bounds
        activityIndicatorView.backgroundColor = .black
        activityIndicatorView.alpha = 0.3
        
        let loadIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicatorView.addSubview(loadIndicator)
        loadIndicator.center = view.center
        loadIndicator.startAnimating()
        
        return activityIndicatorView
    }
}


// MARK: - LoadingViewProtocol
extension BaseViewController: ActivityIndicatorViewProtocol {
    func showActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let `activityIndicatorView` = self?.activityIndicatorView else { return }
            self?.view.addSubview(activityIndicatorView)
        }
    }
    
    func removeActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicatorView.removeFromSuperview()
        }
    }
}
