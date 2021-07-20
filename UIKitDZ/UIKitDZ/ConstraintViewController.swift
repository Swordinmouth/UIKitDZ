//
//  ConstraintViewController.swift
//  UIKitDZ
//
//  Created by Valery on 22.06.2021.
//

import UIKit

final class ConstraintViewController: UIViewController {

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
        NSLayoutConstraint(item: backgroundView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: backgroundView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 40).isActive = true
        NSLayoutConstraint(item: backgroundView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .bottomMargin,
                           multiplier: 1,
                           constant: -40).isActive = true
        NSLayoutConstraint(item: backgroundView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: backgroundView,
                           attribute: .height,
                           multiplier: 1/3,
                           constant: 0).isActive = true
}

    private func createRedSqure() {
        NSLayoutConstraint(item: redSquare,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: backgroundView,
                           attribute: .top,
                           multiplier: 1,
                           constant: 30).isActive = true
        NSLayoutConstraint(item: redSquare,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: yellowSquare,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redSquare,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: yellowSquare,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redSquare,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: yellowSquare,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redSquare,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: yellowSquare,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
}

    private func createYellowSqure() {
        NSLayoutConstraint(item: yellowSquare,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: backgroundView,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowSquare,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: backgroundView,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: yellowSquare,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: backgroundView,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -20).isActive = true
        NSLayoutConstraint(item: yellowSquare,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: yellowSquare,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
}

    private func createGreenSqure() {
        NSLayoutConstraint(item: greenSquare,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: yellowSquare,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 30).isActive = true
        NSLayoutConstraint(item: greenSquare,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: backgroundView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: -30).isActive = true
        NSLayoutConstraint(item: greenSquare,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: yellowSquare,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenSquare,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: yellowSquare,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 0).isActive = true
}
}

