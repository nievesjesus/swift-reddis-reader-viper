//
//  ErrorDelegate.swift
//  Viper-Reddis-Reader
//
//  Created by Jesus Nieves on 24/05/2021.
//

import Foundation

protocol ErrorDelegate: AnyObject {
    func showError()
    func onRetry()
}

extension ErrorDelegate where Self: BaseViewController {

    func showError() {
        self.errorView.removeFromSuperview()
        DispatchQueue.main.async { [weak self] in
            self?.onRetry()
            if let view = self?.view, let errorView = self?.errorView {
                view.addSubview(errorView)
            }
        }
        return
    }

}
