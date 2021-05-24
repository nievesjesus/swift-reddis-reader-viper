//
//  MainView.swift
//  LinguisticNative
//
//  Created by Jesus Nieves on 24/05/2021.
//  
//

import Foundation
import UIKit

final class MainView: UIViewController, ViewInterface {
    var presenter: MainPresenter?
    var viewModel: MainViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}
