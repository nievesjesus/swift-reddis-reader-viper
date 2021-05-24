//
//  RequestConversationPresenter.swift
//  LinguisticNative
//
//  Created by Jesus Nieves on 24/05/2021.
//  
//

import Foundation

final class DetailsPresenter: PresenterInterface {
    var router: DetailsRouterPresenterInterface?
    var interactor: DetailsInteractorPresenterInterface?

    weak var viewModel: DetailsViewModel!
}

// MARK: - Presenter -> Router

extension DetailsPresenter: DetailsPresenterRouterInterface {}

// MARK: - Presenter -> Interactor

extension DetailsPresenter: DetailsPresenterInteractorInterface {}

// MARK: - Presenter -> View

extension DetailsPresenter: DetailsPresenterViewInterface {
    func viewDidLoad() {
        /// All didLoad() logic that does not involve explicitly
        /// creating subviews should go here
    }
}
