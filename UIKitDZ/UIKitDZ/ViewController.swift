//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Valery on 22.06.2021.
//

import UIKit

class Word {
     var word = String()
     var newWord = String()
     func compair(word: String) {
         if word == "leohl" {
             newWord = "hello"
         } else {
             newWord = "Try again!"
         }
     }
 }


class ViewController: UIViewController {
    
    let corrector = Word()
    
    var startButton = UIButton()
    var label = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //MARK: - 5 Создать второе приложение MVC у которого на экране будет кнопка "начать" которая вызывает Алерт с сообщением "введите слово"
        startButton.frame = CGRect(x: 110, y: 400, width: 200, height: 50)
        startButton.backgroundColor = .black
        startButton.setTitle("Начать", for: .normal)
        startButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(startButton)
        
        label.frame = CGRect(x: 110, y: 500, width: 200, height: 50)
        label.backgroundColor = .cyan
        label.textColor = .black
        label.textAlignment = .center
        self.view.addSubview(label)
    }


    //MARK: - 6 Нужно ввести "leohl" в Алерт нажимаете "ок" отдаете контролеру а контролер отдаст это в модель которая из буквосочетания "leohl" вернет слово "hello" контролеру а контролер отдаст это лейблу и отобразит это на экране
    @objc func buttonAction(sender: UIButton!) {
        
        let alertController = UIAlertController(title: "Введите слово", message: "попробуйте: leohl", preferredStyle: .alert)
        let action = UIAlertAction(title: "посмотреть результат", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.corrector.word = text!.text!
            
            self.corrector.compair(word: self.corrector.word)
            self.label.text = self.corrector.newWord
        }
        
        alertController.addTextField()

        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}




