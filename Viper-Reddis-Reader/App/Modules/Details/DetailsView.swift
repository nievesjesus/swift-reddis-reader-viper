//
//  DetailsView.swift
//  LinguisticNative
//
//  Created by Jesus Nieves on 24/05/2021.
//  
//

import Foundation
import UIKit

final class DetailsView: UIViewController, ViewInterface {
    var presenter: DetailsPresenter?
    var viewModel: DetailsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}
