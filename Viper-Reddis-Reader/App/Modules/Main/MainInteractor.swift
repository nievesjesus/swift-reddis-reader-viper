//
//  MainInteractor.swift
//  LinguisticNative
//
//  Created by Jesus Nieves on 24/05/2021.
//  
//

import Foundation

final class MainInteractor: InteractorInterface {
    weak var presenter: MainPresenterInteractorInterface?
}

// MARK: - Interactor -> Presenter

extension MainInteractor: MainInteractorPresenterInterface {}
