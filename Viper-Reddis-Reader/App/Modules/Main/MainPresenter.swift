//
//  RequestConversationPresenter.swift
//  LinguisticNative
//
//  Created by Jesus Nieves on 24/05/2021.
//  
//

import Foundation

final class MainPresenter: PresenterInterface {
    var router: MainRouterPresenterInterface?
    var interactor: MainInteractorPresenterInterface?

    weak var viewModel: MainViewModel!
}

// MARK: - Presenter -> Router

extension MainPresenter: MainPresenterRouterInterface {}

// MARK: - Presenter -> Interactor

extension MainPresenter: MainPresenterInteractorInterface {}

// MARK: - Presenter -> View

extension MainPresenter: MainPresenterViewInterface {
    func viewDidLoad() {
        /// All didLoad() logic that does not involve explicitly
        /// creating subviews should go here
    }
}
