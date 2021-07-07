//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Valery on 22.06.2021.
//

import UIKit

final class SignInViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self

        // MARK: - Notifications
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (sender) in
            self.view.frame.origin.y = -100
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (sender) in
            self.view.frame.origin.y = 0
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let isRegistration = UserDefaults.standard.object(forKey: "isRegistration") as? Bool
        if isRegistration != nil {
            showTabBar()
        }
    }

    // MARK: - IBAction
    @IBAction func signInButton(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "isRegistration")
        showTabBar()
    }

    // MARK: - Private methods
    private func showTabBar() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: "tabBar")
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
}



// MARK: - extension for UITextFieldDelegate
extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            emailTextField.becomeFirstResponder()
            return true
        case emailTextField:
            passwordTextField.becomeFirstResponder()
            return true
        case passwordTextField:
            repeatPasswordTextField.becomeFirstResponder()
            return true
        default:
            return repeatPasswordTextField.resignFirstResponder()
        }
    }
    @objc func textFieldDidChange(sender: NSNotification) {
    }
}
