//
//  MainRouter.swift
//  LinguisticNative
//
//  Created by Jesus Nieves on 24/05/2021.
//  
//

import UIKit

final class MainRouter: RouterInterface {
    weak var presenter: MainPresenterRouterInterface?
    var navController: UINavigationController?
}

extension MainRouter: MainRouterPresenterInterface {
    
    func navigateToDetails(sourceView: DetailsView) {
        if let navController = navController {
            let viewController = DetailsModule.build(with: navController)
            navController.present(viewController, animated: true, completion: nil)
        }
    }
    
}
