//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Valery on 22.06.2021.
//

import UIKit

final class ChosenBookController: UIViewController {

    //MARK: - Visual Components
    private var logo = UIImageView(image: UIImage(named: "logobook"))
    private var slogan = UILabel()
    private var bookImage = UIImageView(image: UIImage(named: "platon"))
    private var button = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: - Initializers
        createLogo()
        createSlogan()
        createImage()
        createButton()
    }

    //MARK: - Private Methods
    private func createLogo() {
        logo.frame = CGRect(x: 110, y: 50, width: 200, height: 200)
        logo.contentMode = .scaleAspectFill
        view.addSubview(logo)
    }

    private func createSlogan() {
        slogan.frame = CGRect(x: 60, y: 210, width: 300, height: 50)
        slogan.text = "Don`t be dummy - read books"
        slogan.textColor = .black
        slogan.font = slogan.font.withSize(22)
        slogan.textAlignment = .center
        view.addSubview(slogan)
    }

    private func createImage() {
        bookImage.frame = CGRect(x: 110, y: 400, width: 200, height: 150)
        bookImage.contentMode = .scaleAspectFill
        view.addSubview(bookImage)
    }

    private func createButton() {
        button.frame = CGRect(x: 85, y: 750, width: 250, height: 30)
        button.setTitle("Show free fragment", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(showFreeFragment), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func showFreeFragment() {
        let secondVc = FreeFragmentController()
        secondVc.modalPresentationStyle = .fullScreen
        secondVc.modalTransitionStyle = .partialCurl
        present(secondVc, animated: true)
    }
}

