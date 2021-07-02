//
//  FourthViewController.swift
//  UIKitDZ
//
//  Created by Valery on 01.07.2021.
//

import UIKit

//MARK: - protocol
protocol goToRoot {
    func returnToRootVC()
}

class chosenPizzaController: UIViewController {
    
    //MARK: - Public variables
    var chosenPizza = UILabel()
    var chosenPizzaImage = UIImageView()

    var mozarellaLable = UILabel()
    var hamLabel = UILabel()
    var shroomsLabel = UILabel()
    var olivesLabel = UILabel()
    
    var mozarellaSwitch = UISwitch()
    var hamSwitch = UISwitch()
    var shroomsSwitch = UISwitch()
    var olivesSwitch = UISwitch()
    
    var chooseButton = UIButton()
    var pizzaName = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
                
        self.chosenPizzaImage.frame = CGRect(x: 80, y: 155, width: 260, height: 200)
        chosenPizzaImage.image = UIImage(named: pizzaName)
        self.chosenPizzaImage.contentMode = .scaleAspectFill
        self.view.addSubview(chosenPizzaImage)
        
        self.chosenPizza.frame = CGRect(x: 145, y: 50, width: 300, height: 80)
        self.chosenPizza.text = pizzaName.capitalized
        self.chosenPizza.textColor = .black
        self.chosenPizza.backgroundColor = .white
        self.chosenPizza.font = .systemFont(ofSize: 25)
        self.view.addSubview(chosenPizza)
        
        self.mozarellaLable.frame = CGRect(x: 30, y: 450, width: 200, height: 50)
        self.mozarellaLable.text = "Сыр моцарелла"
        self.mozarellaLable.textColor = .black
        self.mozarellaLable.backgroundColor = .white
        self.mozarellaLable.font = .systemFont(ofSize: 20)
        self.view.addSubview(mozarellaLable)
        
        self.mozarellaSwitch.frame = CGRect(x: 300, y: 458, width: 0, height: 0)
        self.view.addSubview(mozarellaSwitch)

        self.hamLabel.frame = CGRect(x: 30, y: 500, width: 200, height: 50)
        self.hamLabel.text = "Ветчина"
        self.hamLabel.textColor = .black
        self.hamLabel.backgroundColor = .white
        self.hamLabel.font = .systemFont(ofSize: 20)
        self.view.addSubview(hamLabel)
        
        self.hamSwitch.frame = CGRect(x: 300, y: 508, width: 0, height: 0)
        self.view.addSubview(hamSwitch)
        
        self.shroomsLabel.frame = CGRect(x: 30, y: 550, width: 200, height: 50)
        self.shroomsLabel.text = "Грибы"
        self.shroomsLabel.textColor = .black
        self.shroomsLabel.backgroundColor = .white
        self.shroomsLabel.font = .systemFont(ofSize: 20)
        self.view.addSubview(shroomsLabel)
        
        self.shroomsSwitch.frame = CGRect(x: 300, y: 558, width: 0, height: 0)
        self.view.addSubview(shroomsSwitch)
        
        self.olivesLabel.frame = CGRect(x: 30, y: 600, width: 200, height: 50)
        self.olivesLabel.text = "Маслины"
        self.olivesLabel.textColor = .black
        self.olivesLabel.backgroundColor = .white
        self.olivesLabel.font = .systemFont(ofSize: 20)
        self.view.addSubview(olivesLabel)
        
        self.olivesSwitch.frame = CGRect(x: 300, y: 608, width: 0, height: 0)
        self.view.addSubview(olivesSwitch)
        
        self.chooseButton.frame = CGRect(x: 55, y: 750, width: 300, height: 50)
        self.chooseButton.setTitle("Выбрать", for: .normal)
        self.chooseButton.layer.cornerRadius = 10
        self.chooseButton.backgroundColor = .red
        self.chooseButton.addTarget(self, action: #selector(showPaymentController), for: .touchUpInside)
        self.view.addSubview(chooseButton)
        
    }
    
    //MARK: - Public methods
    @objc func showPaymentController() {
        let paymentVC = paymentController()
        paymentVC.text = pizzaName.capitalized
        if mozarellaSwitch.isOn {
            paymentVC.mozarellaText += mozarellaLable.text ?? "nil"
        }
        if hamSwitch.isOn {
            paymentVC.hamText = hamLabel.text ?? "nil"
        }
        if shroomsSwitch.isOn {
            paymentVC.shroomsText = shroomsLabel.text ?? "nil"
        }
        if olivesSwitch.isOn {
            paymentVC.olivesText = olivesLabel.text ?? "nil"
        }
        paymentVC.delegate = self
        let navigationController = UINavigationController(rootViewController: paymentVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true){
        self.view.isHidden = true
        }
        
    }

}

//MARK: - extension for chosenPizzaController
extension chosenPizzaController: goToRoot {
    func returnToRootVC() {
        if let rootNC = self.presentingViewController as? UINavigationController {
            self.dismiss(animated: true)
            rootNC.popToRootViewController(animated: true)
        }
    }
}
