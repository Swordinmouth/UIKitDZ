//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Valery on 22.06.2021.
//

import UIKit

class ViewController: UIViewController {

    //MARK: = 1 Создать экран регистрации где нужно ввести логин и пароль 2 поля и кнопка вход которая ведёт на второй экран.
    let birthdayReminderLabel = UILabel()
    let signInLabel = UILabel()
    let emailLabel = UILabel()
    let emailText = UITextField()
    let emailView = UIView()
    let passwordLabel = UILabel()
    let passwordText = UITextField()
    let passwordView = UIView()
    let eyeImage = UIImageView(image: UIImage(systemName: "eye"))
    let faceIdSwitch = UISwitch()
    let faceIdLabel = UILabel()
    let enterButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        //MARK: 1 Создать экран регистрации где нужно ввести логин и пароль 2 поля и кнопка вход которая ведёт на второй экран.
        birthdayReminderLabel.frame = CGRect(x: 100, y: 150, width: 200, height: 60)
        birthdayReminderLabel.text = "Birthday reminder"
        birthdayReminderLabel.textAlignment = .center
        birthdayReminderLabel.textColor = .blue
        birthdayReminderLabel.font = .systemFont(ofSize: 20)
        birthdayReminderLabel.layer.borderWidth = 1
        birthdayReminderLabel.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(birthdayReminderLabel)
        
        signInLabel.frame = CGRect(x: 45, y: 260, width: 100, height: 40)
        signInLabel.text = "Sign In"
        signInLabel.textColor = .black
        signInLabel.textAlignment = .left
        signInLabel.font = .systemFont(ofSize: 30)
        self.view.addSubview(signInLabel)
        
        emailLabel.frame = CGRect(x: 45, y: 300, width: 100, height: 50)
        emailLabel.text = "Email"
        emailLabel.textColor = .black
        emailLabel.textAlignment = .left
        self.view.addSubview(emailLabel)
        
        emailText.frame = CGRect(x: 45, y: 330, width: 200, height: 50)
        emailText.placeholder = "example@mail.com"
        self.view.addSubview(emailText)
        
        emailView.frame = CGRect(x: 45, y: 380, width: 300, height: 1)
        emailView.backgroundColor = .gray
        self.view.addSubview(emailView)
        
        passwordLabel.frame = CGRect(x: 45, y: 420, width: 250, height: 50)
        passwordLabel.text = "Password"
        passwordLabel.textColor = .black
        passwordLabel.textAlignment = .left
        self.view.addSubview(passwordLabel)
        
        passwordText.frame = CGRect(x: 45, y: 450, width: 290, height: 50)
        passwordText.placeholder = "Enter your password"
        passwordText.isSecureTextEntry = true
        passwordText.rightViewMode = UITextField.ViewMode.always
        passwordText.rightView = eyeImage
        self.view.addSubview(passwordText)
    
        
        passwordView.frame = CGRect(x: 45, y: 500, width: 300, height: 1)
        passwordView.backgroundColor = .gray
        self.view.addSubview(passwordView)
        
        
        faceIdSwitch.frame = CGRect(x: 290, y: 530, width: 0, height: 0)
        faceIdSwitch.isOn = true
        self.view.addSubview(faceIdSwitch)
        
        faceIdLabel.frame = CGRect(x: 130, y: 522, width: 200, height: 50)
        faceIdLabel.text = "Вход по Face ID"
        faceIdLabel.textColor = .black
        faceIdLabel.textAlignment = .left
        self.view.addSubview(faceIdLabel)
        
        enterButton.frame = CGRect(x: 45, y: 650, width: 300, height: 50)
        enterButton.setTitle("Войти", for: .normal)
        enterButton.layer.cornerRadius = 10
        enterButton.backgroundColor = .blue
        enterButton.addTarget(self, action: #selector(enterButtonMethod), for: .touchUpInside)
        self.view.addSubview(enterButton)
        
        
    }

    
    @objc func enterButtonMethod(sender: UIButton!) {
        navigationController?.pushViewController(SecondViewController(), animated: true) //запушился на 2 экран
    }


}


// 3 экран не связан с навигейшн контроллером, делать через present а не пуш
