//
//  paymentController.swift
//  UIKitDZ
//
//  Created by Valery on 01.07.2021.
//

import UIKit

final class PaymentController: UIViewController {
    
    // MARK: - Private Properties

    //MARK: - deliveryLabel
    private var deliveryLabel = UILabel()
    //MARK: - orderLabel
    private var orderLabel = UILabel()
    //MARK: - payButton
    private var payButton = UIButton()
    //MARK: - cardPaymentLabel
    private var cardPaymentLabel = UILabel()
    //MARK: - cashPaymentLabel
    private var cashPaymentLabel = UILabel()
    //MARK: - cardSwitch
    private var cardSwitch = UISwitch()
    //MARK: - cashSwitch
    private var cashSwitch = UISwitch()
    //MARK: - ingridientsLabel
    private var ingridientsLabel = UILabel()
    //MARK: - chosenPizzaName
    private var chosenPizzaName = UILabel()

    //MARK: - chosenMozarellaLabel
    private var chosenMozarella = UILabel()
    
    //MARK: - chosenHamLabel
    private var chosenHam = UILabel()
    
    //MARK: - chosenShroomsLabel
    private var chosenShrooms = UILabel()
    
    //MARK: - chosenOlivesLabel
    private var chosenOlives = UILabel()

    //MARK: - delegate
    var delegate: GoToRoot?
    
    //MARK: - Public Properties
    var text: String = ""
    var mozarellaText: String = ""
    var hamText: String = ""
    var shroomsText: String = ""
    var olivesText: String = ""

        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // MARK: - Visual Components
        //MARK: - deliveryLabel
        deliveryLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        deliveryLabel.text = "Доставка"
        deliveryLabel.textAlignment = .center
        navigationItem.titleView = deliveryLabel
        
        //MARK: - orderLabel
        orderLabel.frame = CGRect(x: 35, y: 130, width: 200, height: 50)
        orderLabel.text = "Ваш заказ:"
        orderLabel.font = .systemFont(ofSize: 30)
        orderLabel.backgroundColor = .white
        orderLabel.textColor = .black
        view.addSubview(orderLabel)
        
        //MARK: - cardPaymentLabel
        cardPaymentLabel.frame = CGRect(x: 70, y: 630, width: 200, height: 50)
        cardPaymentLabel.text = "Оплата картой"
        cardPaymentLabel.font = .systemFont(ofSize: 25)
        cardPaymentLabel.backgroundColor = .white
        cardPaymentLabel.textColor = .black
        view.addSubview(cardPaymentLabel)
        
        //MARK: - cardSwitch
        cardSwitch.frame = CGRect(x: 300, y: 640, width: 0, height: 0)
        cardSwitch.addTarget(self, action: #selector(switches(paramTarget:)), for: .valueChanged)
        view.addSubview(cardSwitch)
        
        //MARK: - cashPaymentLabel
        cashPaymentLabel.frame = CGRect(x: 70, y: 680, width: 200, height: 50)
        cashPaymentLabel.text = "Наличными"
        cashPaymentLabel.font = .systemFont(ofSize: 25)
        cashPaymentLabel.backgroundColor = .white
        cashPaymentLabel.textColor = .black
        view.addSubview(cashPaymentLabel)
        
        //MARK: - cashSwitch
        cashSwitch.frame = CGRect(x: 300, y: 690, width: 0, height: 0)
        cashSwitch.addTarget(self, action: #selector(switches(paramTarget:)), for: .valueChanged)
        view.addSubview(cashSwitch)
        
        //MARK: - payButton
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
        
        //MARK: - chosenPizzaName
        chosenPizzaName.frame = CGRect(x: 35, y: 130, width: 200, height: 50)
        chosenPizzaName.text = text
        chosenPizzaName.font = .systemFont(ofSize: 30)
        chosenPizzaName.backgroundColor = .white
        chosenPizzaName.textColor = .black
        view.addSubview(chosenPizzaName)
        
        //MARK: - ingridientsLabel
        ingridientsLabel.frame = CGRect(x: 100, y: 200, width: 300, height: 50)
        ingridientsLabel.text = "Ингредиенты:"
        ingridientsLabel.font = .systemFont(ofSize: 30)
        ingridientsLabel.backgroundColor = .white
        ingridientsLabel.textColor = .black
        view.addSubview(ingridientsLabel)
        
        //MARK: - chosenMozarellaLabel
        chosenMozarella.frame = CGRect(x: 35, y: 250, width: 300, height: 50)
        chosenMozarella.text = mozarellaText
        chosenMozarella.font = .systemFont(ofSize: 25)
        chosenMozarella.backgroundColor = .white
        chosenMozarella.textColor = .black
        view.addSubview(chosenMozarella)
        
        //MARK: - chosenHamLabel
        chosenHam.frame = CGRect(x: 35, y: 300, width: 300, height: 50)
        chosenHam.text = hamText
        chosenHam.font = .systemFont(ofSize: 25)
        chosenHam.backgroundColor = .white
        chosenHam.textColor = .black
        view.addSubview(chosenHam)
        
        //MARK: - chosenShroomsLabel
        chosenShrooms.frame = CGRect(x: 35, y: 350, width: 300, height: 50)
        chosenShrooms.text = shroomsText
        chosenShrooms.font = .systemFont(ofSize: 25)
        chosenShrooms.backgroundColor = .white
        chosenShrooms.textColor = .black
        view.addSubview(chosenShrooms)
        
        //MARK: - chosenOlivesLabel
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
    
    //MARK: - alertController for payButton
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
    


