//
//  MainModule.swift
//  LinguisticNative
//
//  Created by Jesus Nieves on 24/05/2021.
//  
//

import UIKit

// MARK: - Router -> Presenter

protocol MainRouterPresenterInterface: RouterPresenterInterface {}

// MARK: - Presenter -> Router

protocol MainPresenterRouterInterface: PresenterRouterInterface {}

// MARK: - Presenter -> Interactor

protocol MainPresenterInteractorInterface: PresenterInteractorInterface {}

// MARK: - Presenter -> View

protocol MainPresenterViewInterface: PresenterViewInterface {
    func viewDidLoad()
}

// MARK: - Interactor -> Presenter

protocol MainInteractorPresenterInterface: InteractorPresenterInterface {}

// MARK: - Module Builder

final class MainModule: ModuleInterface {
    typealias View = MainView
    typealias Presenter = MainPresenter
    typealias Router = MainRouter
    typealias Interactor = MainInteractor

    static func build() -> UIViewController {
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()

        let viewModel = MainViewModel()
        let view = View()

        view.presenter = presenter
        view.viewModel = viewModel

        presenter.viewModel = viewModel

        assemble(
            presenter: presenter,
            router: router,
            interactor: interactor
        )

        return view
    }
}
