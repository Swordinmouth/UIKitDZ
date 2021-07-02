//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Valery on 22.06.2021.
//

import UIKit

class registrarionController: UIViewController {
    //MARK: - Public variables
    var logoImage = UIImageView(image: UIImage(named: "лого.jpg"))
    var loginLabel = UILabel()
    var passwordLabel = UILabel()
    var loginTextField = UITextField()
    var passwordTextField = UITextField()
    var loginView = UIView()
    var passwordView = UIView()
    var enterButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.logoImage.frame = CGRect(x: 110, y: 110, width: 200, height: 200)
        self.logoImage.contentMode = .scaleAspectFill
        self.view.addSubview(self.logoImage)
        
        self.loginLabel.frame = CGRect(x: 45, y: 380, width: 250, height: 40)
        self.loginLabel.text = "Введите номер телефона"
        self.loginLabel.font = .systemFont(ofSize: 17)
        self.loginLabel.backgroundColor = .white
        self.loginLabel.textColor = .black
        self.view.addSubview(loginLabel)
        
        self.loginTextField.frame = CGRect(x: 45, y: 410, width: 200, height: 50)
        self.loginTextField.placeholder = "8 999 999 99 99"
        self.loginTextField.keyboardType = .numberPad
        self.view.addSubview(loginTextField)
        
        self.loginView.frame = CGRect(x: 45, y: 460, width: 300, height: 1)
        self.loginView.backgroundColor = .gray
        self.view.addSubview(loginView)
        
        self.passwordLabel.frame = CGRect(x: 45, y: 520, width: 250, height: 40)
        self.passwordLabel.text = "Введите пароль"
        self.passwordLabel.font = .systemFont(ofSize: 17)
        self.passwordLabel.backgroundColor = .white
        self.passwordLabel.textColor = .black
        self.view.addSubview(passwordLabel)
        
        self.passwordTextField.frame = CGRect(x: 45, y: 550, width: 200, height: 50)
        self.passwordTextField.placeholder = "Только цифры"
        self.passwordTextField.isSecureTextEntry = true
        self.view.addSubview(passwordTextField)
        
        self.passwordView.frame = CGRect(x: 45, y: 600, width: 300, height: 1)
        self.passwordView.backgroundColor = .gray
        self.view.addSubview(passwordView)
        
        self.enterButton.frame = CGRect(x: 55, y: 800, width: 300, height: 50)
        self.enterButton.setTitle("Войти", for: .normal)
        self.enterButton.layer.cornerRadius = 10
        self.enterButton.backgroundColor = .red
        self.enterButton.addTarget(self, action: #selector(showfoodController), for: .touchUpInside)
        self.view.addSubview(enterButton)
        
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
    }

    //MARK: - Public methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    } //Чтобы убрать клавиатуру при нажатии на любое место на экране

    @objc func showfoodController(parametrSender: Any) {
        let secondVC = foodController()
        let navController = UINavigationController(rootViewController: secondVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
    
}

//MARK: - extension for UITextField
extension registrarionController: UITextFieldDelegate {
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.loginTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        return true
     }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
 }
