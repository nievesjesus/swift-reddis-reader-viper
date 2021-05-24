//
//  ErrorView.swift
//  Viper-Reddis-Reader
//
//  Created by Jesus Nieves on 24/05/2021.
//

import UIKit

typealias ErrorViewPressedCallback = () -> Void

class ErrorView: UIView {

    var onRetryPressed: ErrorViewPressedCallback?

    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "error")
        return view
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Oops, sorry something has failed"
        label.textAlignment = .center
        return label
    }()

    private lazy var retryButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25.0
        button.setTitle("Retry", for: .normal)
        button.addTarget(self, action: #selector(self.retryPressed), for: .touchUpInside)
        return button
    }()

    private lazy var retryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "You can try to refresh the app."
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupView()
        self.setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ErrorView: ProgrammaticallyLayout {

    func setupView() {
        self.retryButton.addTarget(self, action: #selector(self.retryPressed), for: .touchDown)
        self.backgroundColor = .white
        self.addSubview(self.iconImageView)
        self.addSubview(self.descriptionLabel)
        self.addSubview(self.retryButton)
        self.addSubview(self.retryLabel)

    }

    func setupConstraints() {
    }

}

extension ErrorView {

    @objc func retryPressed () {
        guard let callback = self.onRetryPressed else { return }
        self.removeFromSuperview()
        callback()
    }

}
