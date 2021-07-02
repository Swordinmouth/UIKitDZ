//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Valery on 01.07.2021.
//

import UIKit

class foodController: UIViewController {
    
    //MARK: - Public variables
    var chooseLabel = UILabel()
    var pizzaButton = UIButton()
    var sushiButton = UIButton()
    var pizzaLabel = UILabel()
    var sushiLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Food"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        self.chooseLabel.frame = CGRect(x: 115, y: 110, width: 200, height: 50)
        self.chooseLabel.text = "Что хотите заказать?"
        self.chooseLabel.font = .systemFont(ofSize: 20)
        self.chooseLabel.backgroundColor = .white
        self.chooseLabel.textColor = .black
        self.view.addSubview(chooseLabel)
        
        self.pizzaLabel.frame = CGRect(x: 35, y: 170, width: 100, height: 30)
        self.pizzaLabel.text = "Пицца"
        self.pizzaLabel.font = .systemFont(ofSize: 20)
        self.pizzaLabel.backgroundColor = .white
        self.pizzaLabel.textColor = .black
        self.view.addSubview(pizzaLabel)
        
        self.pizzaButton.frame = CGRect(x: 35, y: 200, width: 350, height: 180)
        self.pizzaButton.setBackgroundImage(UIImage(named: "пицца"), for: .normal)
        self.pizzaButton.contentMode = .scaleAspectFill
        self.pizzaButton.addTarget(self, action: #selector(showpizzaController), for: .touchUpInside)
        self.view.addSubview(pizzaButton)
        
        self.sushiLabel.frame = CGRect(x: 35, y: 390, width: 100, height: 30)
        self.sushiLabel.text = "Суши"
        self.sushiLabel.font = .systemFont(ofSize: 20)
        self.sushiLabel.backgroundColor = .white
        self.sushiLabel.textColor = .black
        self.view.addSubview(sushiLabel)
        
        self.sushiButton.frame = CGRect(x: 35, y: 420, width: 350, height: 180)
        self.sushiButton.setBackgroundImage(UIImage(named: "суши"), for: .normal)
        self.pizzaButton.contentMode = .scaleAspectFill
        self.view.addSubview(sushiButton)
        
    }
    //MARK: - Public methods
    @objc func showpizzaController(parametrSender: Any) {
        let thirdVC = pizzaController()
        self.navigationController?.pushViewController(thirdVC, animated: true)
    }


}
