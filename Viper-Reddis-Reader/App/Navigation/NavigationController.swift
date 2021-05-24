//
//  NavigationController.swift
//  Viper-Reddis-Reader
//
//  Created by Jesus Nieves on 24/05/2021.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.prefersLargeTitles = true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

}
