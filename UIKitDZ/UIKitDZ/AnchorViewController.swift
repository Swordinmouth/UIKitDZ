//
//  AnchorViewController.swift
//  UIKitDZ
//
//  Created by Valery on 20.07.2021.
//

import UIKit

final class AnchorViewController: UIViewController {

    //MARK: - Visual Components
    private let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view

    }()

    private let redSquare: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

    private let yellowSquare: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()

    private let greenSquare: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: - Private Methods
    private func setupView() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(redSquare)
        backgroundView.addSubview(yellowSquare)
        backgroundView.addSubview(greenSquare)
        createBackgroundViewConstraint()
        createRedSqure()
        createYellowSqure()
        createGreenSqure()
    }

    private func createBackgroundViewConstraint() {
        let margin = view.layoutMarginsGuide
        backgroundView.centerXAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: margin.topAnchor, constant: 40).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -40).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 1/3).isActive = true
}
    private func createRedSqure() {
        redSquare.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 30).isActive = true
        redSquare.leadingAnchor.constraint(equalTo: yellowSquare.leadingAnchor).isActive = true
        redSquare.trailingAnchor.constraint(equalTo: yellowSquare.trailingAnchor).isActive = true
        redSquare.heightAnchor.constraint(equalTo: yellowSquare.heightAnchor).isActive = true
        redSquare.widthAnchor.constraint(equalTo: yellowSquare.widthAnchor).isActive = true
}

    private func createYellowSqure() {
        yellowSquare.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        yellowSquare.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20).isActive = true
        yellowSquare.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20).isActive = true
        yellowSquare.widthAnchor.constraint(equalTo: yellowSquare.heightAnchor).isActive = true
}

    private func createGreenSqure() {
        greenSquare.topAnchor.constraint(equalTo: yellowSquare.bottomAnchor, constant: 30).isActive = true
        greenSquare.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -30).isActive = true
        greenSquare.leadingAnchor.constraint(equalTo: yellowSquare.leadingAnchor).isActive = true
        greenSquare.trailingAnchor.constraint(equalTo: yellowSquare.trailingAnchor).isActive = true
}
}
