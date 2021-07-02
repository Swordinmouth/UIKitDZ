//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Valery on 22.06.2021.
//

import UIKit

final class RegistrarionController: UIViewController {
    // MARK: - Private Properties

    //MARK: - logoImage
    private var logoImage = UIImageView(image: UIImage(named: "лого.jpg"))
    //MARK: - loginLabel
    private var loginLabel = UILabel()
    //MARK: - passwordLabel
    private var passwordLabel = UILabel()
    //MARK: - loginTextField
    private var loginTextField = UITextField()
    //MARK: - passwordTextField
    private var passwordTextField = UITextField()
    //MARK: - loginView
    private var loginView = UIView()
    //MARK: - passwordView
    private var passwordView = UIView()
    //MARK: - enterButton
    private var enterButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // MARK: - Visual Components
        //MARK: - logoImage
        logoImage.frame = CGRect(x: 110, y: 110, width: 200, height: 200)
        logoImage.contentMode = .scaleAspectFill
        view.addSubview(self.logoImage)
        
        //MARK: - loginLabel
        loginLabel.frame = CGRect(x: 45, y: 380, width: 250, height: 40)
        loginLabel.text = "Введите номер телефона"
        loginLabel.font = .systemFont(ofSize: 17)
        loginLabel.backgroundColor = .white
        loginLabel.textColor = .black
        view.addSubview(loginLabel)
        
        //MARK: - loginTextField
        loginTextField.frame = CGRect(x: 45, y: 410, width: 200, height: 50)
        loginTextField.placeholder = "8 999 999 99 99"
        loginTextField.keyboardType = .numberPad
        view.addSubview(loginTextField)
        
        //MARK: - loginView
        loginView.frame = CGRect(x: 45, y: 460, width: 300, height: 1)
        loginView.backgroundColor = .gray
        view.addSubview(loginView)
        
        //MARK: - passwordLabel
        passwordLabel.frame = CGRect(x: 45, y: 520, width: 250, height: 40)
        passwordLabel.text = "Введите пароль"
        passwordLabel.font = .systemFont(ofSize: 17)
        passwordLabel.backgroundColor = .white
        passwordLabel.textColor = .black
        view.addSubview(passwordLabel)
        
        //MARK: - passwordTextField
        passwordTextField.frame = CGRect(x: 45, y: 550, width: 200, height: 50)
        passwordTextField.placeholder = "Только цифры"
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        
        //MARK: - passwordView
        passwordView.frame = CGRect(x: 45, y: 600, width: 300, height: 1)
        passwordView.backgroundColor = .gray
        view.addSubview(passwordView)
        
        //MARK: - enterButton
        enterButton.frame = CGRect(x: 55, y: 800, width: 300, height: 50)
        enterButton.setTitle("Войти", for: .normal)
        enterButton.layer.cornerRadius = 10
        enterButton.backgroundColor = .red
        enterButton.addTarget(self, action: #selector(showfoodController), for: .touchUpInside)
        view.addSubview(enterButton)
        
        //MARK: - texfields delaegate
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }

    //MARK: - Public methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    } //Чтобы убрать клавиатуру при нажатии на любое место на экране

    
    @objc func showfoodController(parametrSender: Any) {
        let secondVC = FoodController()
        let navController = UINavigationController(rootViewController: secondVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
    
}

//MARK: - extension for UITextField
extension RegistrarionController: UITextFieldDelegate {
    
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
