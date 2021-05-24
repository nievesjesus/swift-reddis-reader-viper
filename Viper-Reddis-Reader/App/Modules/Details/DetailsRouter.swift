//
//  DetailsRouter.swift
//  LinguisticNative
//
//  Created by Jesus Nieves on 24/05/2021.
//  
//

import UIKit

final class DetailsRouter: RouterInterface {
    weak var presenter: DetailsPresenterRouterInterface?
    var navController: UINavigationController?
}

extension DetailsRouter: DetailsRouterPresenterInterface {}
