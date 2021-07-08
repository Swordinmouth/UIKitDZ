//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Valery on 22.06.2021.
//

import UIKit

final class ChosenBookController: UIViewController {

    //MARK: - Visual Components
    private var logoImageView = UIImageView(image: UIImage(named: "logobook"))
    private var sloganLabel = UILabel()
    private var bookImageView = UIImageView(image: UIImage(named: "platon"))
    private var enterUIButton = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()

        createLogoImageView()
        createSloganLabel()
        createBookImageView()
        createEnterUIButton()
    }

    //MARK: - Private Methods
    private func createLogoImageView() {
        logoImageView.frame = CGRect(x: 110, y: 50, width: 200, height: 200)
        logoImageView.contentMode = .scaleAspectFill
        view.addSubview(logoImageView)
    }

    private func createSloganLabel() {
        sloganLabel.frame = CGRect(x: 60, y: 210, width: 300, height: 50)
        sloganLabel.text = "Don`t be dummy - read books"
        sloganLabel.textColor = .black
        sloganLabel.font = sloganLabel.font.withSize(22)
        sloganLabel.textAlignment = .center
        view.addSubview(sloganLabel)
    }

    private func createBookImageView() {
        bookImageView.frame = CGRect(x: 110, y: 400, width: 200, height: 150)
        bookImageView.contentMode = .scaleAspectFill
        view.addSubview(bookImageView)
    }

    private func createEnterUIButton() {
        enterUIButton.frame = CGRect(x: 85, y: 750, width: 250, height: 30)
        enterUIButton.setTitle("Show free fragment", for: .normal)
        enterUIButton.layer.cornerRadius = 10
        enterUIButton.backgroundColor = .systemPink
        enterUIButton.addTarget(self, action: #selector(showFreeFragmentController), for: .touchUpInside)
        view.addSubview(enterUIButton)
    }

    @objc private func showFreeFragmentController() {
        let secondVc = FreeFragmentController()
        secondVc.modalPresentationStyle = .fullScreen
        secondVc.modalTransitionStyle = .partialCurl
        present(secondVc, animated: true)
    }
}

