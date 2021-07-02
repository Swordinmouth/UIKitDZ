//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Valery on 01.07.2021.
//

import UIKit

final class FoodController: UIViewController {
    
    // MARK: - Private Properties

    //MARK: - chooseLabel
    private var chooseLabel = UILabel()
    //MARK: - pizzaButton
    private var pizzaButton = UIButton()
    //MARK: - sushiButton
    private var sushiButton = UIButton()
    //MARK: - pizzaLabel
    private var pizzaLabel = UILabel()
    //MARK: - sushiLabel
    private var sushiLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Food"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // MARK: - Visual Components
        //MARK: - chooseLabel
        chooseLabel.frame = CGRect(x: 115, y: 110, width: 200, height: 50)
        chooseLabel.text = "Что хотите заказать?"
        chooseLabel.font = .systemFont(ofSize: 20)
        chooseLabel.backgroundColor = .white
        chooseLabel.textColor = .black
        view.addSubview(chooseLabel)
        
        //MARK: - pizzaLabel
        pizzaLabel.frame = CGRect(x: 35, y: 170, width: 100, height: 30)
        pizzaLabel.text = "Пицца"
        pizzaLabel.font = .systemFont(ofSize: 20)
        pizzaLabel.backgroundColor = .white
        pizzaLabel.textColor = .black
        view.addSubview(pizzaLabel)
        
        //MARK: - pizzaButton
        pizzaButton.frame = CGRect(x: 35, y: 200, width: 350, height: 180)
        pizzaButton.setBackgroundImage(UIImage(named: "пицца"), for: .normal)
        pizzaButton.contentMode = .scaleAspectFill
        pizzaButton.addTarget(self, action: #selector(showpizzaController), for: .touchUpInside)
        view.addSubview(pizzaButton)
        
        //MARK: - sushiLabel
        sushiLabel.frame = CGRect(x: 35, y: 390, width: 100, height: 30)
        sushiLabel.text = "Суши"
        sushiLabel.font = .systemFont(ofSize: 20)
        sushiLabel.backgroundColor = .white
        sushiLabel.textColor = .black
        view.addSubview(sushiLabel)
        
        //MARK: - sushiButton
        sushiButton.frame = CGRect(x: 35, y: 420, width: 350, height: 180)
        sushiButton.setBackgroundImage(UIImage(named: "суши"), for: .normal)
        pizzaButton.contentMode = .scaleAspectFill
        view.addSubview(sushiButton)
        
    }
    //MARK: - Public methods
    @objc func showpizzaController(parametrSender: Any) {
        let thirdVC = PizzaController()
        self.navigationController?.pushViewController(thirdVC, animated: true)
    }


}
