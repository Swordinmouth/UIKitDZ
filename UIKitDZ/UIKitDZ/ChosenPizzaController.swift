//
//  FourthViewController.swift
//  UIKitDZ
//
//  Created by Valery on 01.07.2021.
//

import UIKit

//MARK: - protocol
protocol GoToRoot {
    func returnToRootVC()
}

final class ChosenPizzaController: UIViewController {
    
    // MARK: - Private Properties

    //MARK: - chosenPizzaLable
    private var chosenPizza = UILabel()
    //MARK: - chosenPizzaUIImageView
    private var chosenPizzaImage = UIImageView()
    //MARK: - mozarellaLable
    private var mozarellaLable = UILabel()
    //MARK: - hamLabel
    private var hamLabel = UILabel()
    //MARK: - shroomsLabel
    private var shroomsLabel = UILabel()
    //MARK: - olivesLabel
    private var olivesLabel = UILabel()
    //MARK: - mozarellaSwitch
    private var mozarellaSwitch = UISwitch()
    //MARK: - hamSwitch
    private var hamSwitch = UISwitch()
    //MARK: - shroomsSwitch
    private var shroomsSwitch = UISwitch()
    //MARK: - olivesSwitch
    private var olivesSwitch = UISwitch()
    //MARK: - chooseButton
    private var chooseButton = UIButton()
    
    // MARK: - Public Properties
    //MARK: - pizzaName
    var pizzaName = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
                
        // MARK: - Visual Components
        //MARK: - chosenPizzaUIImageView
        chosenPizzaImage.frame = CGRect(x: 80, y: 155, width: 260, height: 200)
        chosenPizzaImage.image = UIImage(named: pizzaName)
        chosenPizzaImage.contentMode = .scaleAspectFill
        view.addSubview(chosenPizzaImage)
        
        //MARK: - chosenPizzaLable
        chosenPizza.frame = CGRect(x: 145, y: 50, width: 300, height: 80)
        chosenPizza.text = pizzaName.capitalized
        chosenPizza.textColor = .black
        chosenPizza.backgroundColor = .white
        chosenPizza.font = .systemFont(ofSize: 25)
        view.addSubview(chosenPizza)
        
        //MARK: - mozarellaLable
        mozarellaLable.frame = CGRect(x: 30, y: 450, width: 200, height: 50)
        mozarellaLable.text = "Сыр моцарелла"
        mozarellaLable.textColor = .black
        mozarellaLable.backgroundColor = .white
        mozarellaLable.font = .systemFont(ofSize: 20)
        view.addSubview(mozarellaLable)
        
        //MARK: - mozarellaSwitch
        mozarellaSwitch.frame = CGRect(x: 300, y: 458, width: 0, height: 0)
        view.addSubview(mozarellaSwitch)

        //MARK: - hamLabel
        hamLabel.frame = CGRect(x: 30, y: 500, width: 200, height: 50)
        hamLabel.text = "Ветчина"
        hamLabel.textColor = .black
        hamLabel.backgroundColor = .white
        hamLabel.font = .systemFont(ofSize: 20)
        view.addSubview(hamLabel)
        
        //MARK: - hamSwitch
        hamSwitch.frame = CGRect(x: 300, y: 508, width: 0, height: 0)
        view.addSubview(hamSwitch)
        
        //MARK: - shroomsLabel
        shroomsLabel.frame = CGRect(x: 30, y: 550, width: 200, height: 50)
        shroomsLabel.text = "Грибы"
        shroomsLabel.textColor = .black
        shroomsLabel.backgroundColor = .white
        shroomsLabel.font = .systemFont(ofSize: 20)
        view.addSubview(shroomsLabel)
        
        //MARK: - shroomsSwitch
        shroomsSwitch.frame = CGRect(x: 300, y: 558, width: 0, height: 0)
        view.addSubview(shroomsSwitch)
        
        //MARK: - olivesLabel
        olivesLabel.frame = CGRect(x: 30, y: 600, width: 200, height: 50)
        olivesLabel.text = "Маслины"
        olivesLabel.textColor = .black
        olivesLabel.backgroundColor = .white
        olivesLabel.font = .systemFont(ofSize: 20)
        view.addSubview(olivesLabel)
        
        //MARK: - olivesSwitch
        olivesSwitch.frame = CGRect(x: 300, y: 608, width: 0, height: 0)
        view.addSubview(olivesSwitch)
        
        //MARK: - chooseButton
        chooseButton.frame = CGRect(x: 55, y: 750, width: 300, height: 50)
        chooseButton.setTitle("Выбрать", for: .normal)
        chooseButton.layer.cornerRadius = 10
        chooseButton.backgroundColor = .red
        chooseButton.addTarget(self, action: #selector(showPaymentController), for: .touchUpInside)
        view.addSubview(chooseButton)
        
    }
    
    //MARK: - Public methods
    @objc func showPaymentController() {
        let paymentVC = PaymentController()
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
extension ChosenPizzaController: GoToRoot {
    func returnToRootVC() {
        if let rootNC = self.presentingViewController as? UINavigationController {
            self.dismiss(animated: true)
            rootNC.popToRootViewController(animated: true)
        }
    }
}
