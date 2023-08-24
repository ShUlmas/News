//
//  ViewController+Extension.swift
//  News
//
//  Created by O'lmasbek on 24/08/23.
//

import UIKit


fileprivate var containerView: UIView!

extension UIViewController {
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        UIView.animate(withDuration: 0.2) {
            containerView.alpha = 0.8
        }
        
        let loadingIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        loadingIndicator.startAnimating()
        //HapticsManager.shared.vibrate(for: .success)
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
}
