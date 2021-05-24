//
//  DetailsModule.swift
//  LinguisticNative
//
//  Created by Jesus Nieves on 24/05/2021.
//  
//

import UIKit

// MARK: - Router -> Presenter

protocol DetailsRouterPresenterInterface: RouterPresenterInterface {}

// MARK: - Presenter -> Router

protocol DetailsPresenterRouterInterface: PresenterRouterInterface {}

// MARK: - Presenter -> Interactor

protocol DetailsPresenterInteractorInterface: PresenterInteractorInterface {}

// MARK: - Presenter -> View

protocol DetailsPresenterViewInterface: PresenterViewInterface {
    func viewDidLoad()
}

// MARK: - Interactor -> Presenter

protocol DetailsInteractorPresenterInterface: InteractorPresenterInterface {}

// MARK: - View -> Presenter

protocol DetailsViewInterface: PresenterViewInterface {
    func reloadData()
    func setupView()
}

// MARK: - Module Builder

final class DetailsModule: ModuleInterface {
    typealias View = DetailsView
    typealias Presenter = DetailsPresenter
    typealias Router = DetailsRouter
    typealias Interactor = DetailsInteractor

    static func build(with navController: UINavigationController) -> UIViewController {
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()

        let viewModel = DetailsViewModel()
        let view = View()

        router.navController = navController
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
