//
//  DetailsInteractor.swift
//  LinguisticNative
//
//  Created by Jesus Nieves on 24/05/2021.
//  
//

import Foundation

final class DetailsInteractor: InteractorInterface {
    weak var presenter: DetailsPresenterInteractorInterface?
    
}

// MARK: - Interactor -> Presenter

extension DetailsInteractor: DetailsInteractorPresenterInterface {}
