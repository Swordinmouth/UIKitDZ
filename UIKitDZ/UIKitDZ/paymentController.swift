//
//  paymentController.swift
//  UIKitDZ
//
//  Created by Valery on 01.07.2021.
//

import UIKit

class paymentController: UIViewController {
    
    //MARK: - Public variables
    var deliveryLabel = UILabel()
    var orderLabel = UILabel()
    var payButton = UIButton()
    var cardPaymentLabel = UILabel()
    var cashPaymentLabel = UILabel()
    var cardSwitch = UISwitch()
    var cashSwitch = UISwitch()
    var ingridientsLabel = UILabel()
    
    var chosenPizzaName = UILabel()
    var text: String = ""

    var chosenMozarella = UILabel()
    var mozarellaText: String = ""
    
    var chosenHam = UILabel()
    var hamText: String = ""
    
    var chosenShrooms = UILabel()
    var shroomsText: String = ""
    
    var chosenOlives = UILabel()
    var olivesText: String = ""

    
    var delegate: goToRoot?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        deliveryLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        deliveryLabel.text = "Доставка"
        deliveryLabel.textAlignment = .center
        navigationItem.titleView = deliveryLabel
        
        orderLabel.frame = CGRect(x: 35, y: 130, width: 200, height: 50)
        orderLabel.text = "Ваш заказ:"
        orderLabel.font = .systemFont(ofSize: 30)
        orderLabel.backgroundColor = .white
        orderLabel.textColor = .black
        view.addSubview(orderLabel)
        
        cardPaymentLabel.frame = CGRect(x: 70, y: 630, width: 200, height: 50)
        cardPaymentLabel.text = "Оплата картой"
        cardPaymentLabel.font = .systemFont(ofSize: 25)
        cardPaymentLabel.backgroundColor = .white
        cardPaymentLabel.textColor = .black
        view.addSubview(cardPaymentLabel)
        
        cardSwitch.frame = CGRect(x: 300, y: 640, width: 0, height: 0)
        cardSwitch.addTarget(self, action: #selector(switches(paramTarget:)), for: .valueChanged)
        view.addSubview(cardSwitch)
        
        cashPaymentLabel.frame = CGRect(x: 70, y: 680, width: 200, height: 50)
        cashPaymentLabel.text = "Наличными"
        cashPaymentLabel.font = .systemFont(ofSize: 25)
        cashPaymentLabel.backgroundColor = .white
        cashPaymentLabel.textColor = .black
        view.addSubview(cashPaymentLabel)
        
        cashSwitch.frame = CGRect(x: 300, y: 690, width: 0, height: 0)
        cashSwitch.addTarget(self, action: #selector(switches(paramTarget:)), for: .valueChanged)
        view.addSubview(cashSwitch)
        
        payButton.frame = CGRect(x: 55, y: 750, width: 300, height: 50)
        payButton.setBackgroundImage(UIImage(systemName: "applelogo"), for: .normal)
        payButton.layoutIfNeeded()
        payButton.subviews.first?.contentMode = .scaleAspectFit
        payButton.tintColor = .white
        payButton.setTitle("Pay", for: .normal)
        payButton.titleLabel?.font = .systemFont(ofSize: 30)
        payButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 0)
        payButton.layer.cornerRadius = 10
        payButton.backgroundColor = .black
        payButton.addTarget(self, action: #selector(alert), for: .touchUpInside)
        view.addSubview(payButton)
        
        chosenPizzaName.frame = CGRect(x: 35, y: 130, width: 200, height: 50)
        chosenPizzaName.text = text
        chosenPizzaName.font = .systemFont(ofSize: 30)
        chosenPizzaName.backgroundColor = .white
        chosenPizzaName.textColor = .black
        view.addSubview(chosenPizzaName)
        
        ingridientsLabel.frame = CGRect(x: 100, y: 200, width: 300, height: 50)
        ingridientsLabel.text = "Ингредиенты:"
        ingridientsLabel.font = .systemFont(ofSize: 30)
        ingridientsLabel.backgroundColor = .white
        ingridientsLabel.textColor = .black
        view.addSubview(ingridientsLabel)
        
        chosenMozarella.frame = CGRect(x: 35, y: 250, width: 300, height: 50)
        chosenMozarella.text = mozarellaText
        chosenMozarella.font = .systemFont(ofSize: 25)
        chosenMozarella.backgroundColor = .white
        chosenMozarella.textColor = .black
        view.addSubview(chosenMozarella)
        
        chosenHam.frame = CGRect(x: 35, y: 300, width: 300, height: 50)
        chosenHam.text = hamText
        chosenHam.font = .systemFont(ofSize: 25)
        chosenHam.backgroundColor = .white
        chosenHam.textColor = .black
        view.addSubview(chosenHam)
        
        chosenShrooms.frame = CGRect(x: 35, y: 350, width: 300, height: 50)
        chosenShrooms.text = shroomsText
        chosenShrooms.font = .systemFont(ofSize: 25)
        chosenShrooms.backgroundColor = .white
        chosenShrooms.textColor = .black
        view.addSubview(chosenShrooms)
        
        chosenOlives.frame = CGRect(x: 35, y: 400, width: 300, height: 50)
        chosenOlives.text = olivesText
        chosenOlives.font = .systemFont(ofSize: 25)
        chosenOlives.backgroundColor = .white
        chosenOlives.textColor = .black
        view.addSubview(chosenOlives)
        
        
    }

    //MARK: - Public methods
    @objc func switches(paramTarget: UISwitch) {
        if cardSwitch.isOn {
            cashSwitch.setOn(false, animated: true)
        } else if cardSwitch.isOn == false {
            cashSwitch.setOn(true, animated: true)
        }
    }
    
    @objc func alert() {
        let alertController = UIAlertController(title: "Заказ оплачен", message: "Ваш заказ доставят в течение 15 минут! Приятного аппетита", preferredStyle: .alert)
        let action = UIAlertAction(title: "ОК", style: .cancel) { (action) in
            self.dismiss(animated: true)
            self.delegate?.returnToRootVC()

        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
    }
   
}
    


