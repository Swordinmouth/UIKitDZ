//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Valery on 22.06.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        additionButton = UIButton(frame: CGRect(x: 210, y: 500, width: 200, height: 50))
        additionButton.backgroundColor = .red
        additionButton.setTitle("Сложение", for: .normal)
        additionButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(additionButton)
        
        guessButton = UIButton(frame: CGRect(x: 5, y: 500, width: 200, height: 50))
        guessButton.backgroundColor = .blue
        guessButton.setTitle("Угадай число", for: .normal)
        guessButton.addTarget(self, action: #selector(buttonActionTwo), for: .touchUpInside)
        self.view.addSubview(guessButton)
        
        resultLabel = UILabel(frame: CGRect(x: 210, y: 600, width: 200, height: 50))
        resultLabel.backgroundColor = .green
        resultLabel.textAlignment = .center
        resultLabel.text = "Результат"
        self.view.addSubview(resultLabel)
        
        guessLable = UILabel(frame: CGRect(x: 5, y: 600, width: 200, height: 50))
        guessLable.backgroundColor = .green
        guessLable.textAlignment = .center
        guessLable.text = "Твой вариант"
        self.view.addSubview(guessLable)
    }

    //MARK: - 1.Написать свое мини приложение на первом экране две кнопки "сложение" и "угадай число"
    var additionButton = UIButton()
    var guessButton = UIButton()

    
    
    //MARK: - 2 При попадании на этот экран запрашивать ФИО через алер и отображать в UILabel
    var labelProfile = UILabel()
    func alert(titel: String, message: String, style: UIAlertController.Style) {
        labelProfile = UILabel(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        labelProfile.backgroundColor = .cyan
        labelProfile.textAlignment = .center
        labelProfile.text = "Здравствуйте, "
        self.view.addSubview(labelProfile)
        
        let alertController = UIAlertController(title: titel, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ввести", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.labelProfile.text! += (text?.text)! + ("!")

        }
        
        alertController.addTextField()
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        alert(titel: "Авторизуйтесь", message: "Введите Ф.И.О", style: .alert)
    }
    
    //MARK: - 3 По нажатию на "сложение" открывать Алерт который просит ввести число 1 и число 2 и кнопка посчитать выводит результат в любом виде юзеру
    var resultLabel = UILabel()
    @objc func buttonAction(sender: UIButton!) {
        
        let alertController = UIAlertController(title: "Введите:", message: "два числа", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ввод", style: .default) { (action) in
            let numberOne = alertController.textFields?.first
            let numberTwo = alertController.textFields?.last
            let result = Int(numberOne?.text ?? "0")! + Int(numberTwo?.text ?? "0")!
            self.resultLabel.text = ("\(result)")
        }
        
        alertController.addTextField()
        alertController.addTextField()

        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

    
    //MARK: - 4 При нажатии на кнопку "угадай число" нужно придумать игру где нужно угадать число
    var guessLable = UILabel()
    @objc func buttonActionTwo(sender: UIButton!) {
        let alertController = UIAlertController(title: "Угадай число", message: "Введите от 1 до 10", preferredStyle: .alert)
        let action = UIAlertAction(title: "С такой удачей мне только в казино играть", style: .default) { (action) in
            let text = alertController.textFields?.first
            let randomInt = Int.random(in: 1...10)

            if randomInt == Int(text?.text ?? "0")! {
                self.guessLable.text = ("Congrats, homie!")
            } else {
                self.guessLable.text = ("Try harder!")
            }
            
        }
        
        alertController.addTextField()

        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

}
