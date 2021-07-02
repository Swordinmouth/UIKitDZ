//
//  ThirdViewController.swift
//  UIKitDZ
//
//  Created by Valery on 01.07.2021.
//

import UIKit

class pizzaController: UIViewController {
    
    //MARK: - Public variables
    var margaritaImage = UIImageView(image: UIImage(named: "маргарита.jpg"))
    var pepperoniImage = UIImageView(image: UIImage(named: "пепперони.jpg"))
    var margaritaLabel = UILabel()
    var pepperoniLabel = UILabel()
    var margaritaButton = UIButton()
    var peperoniButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Pizza"

        self.margaritaImage.frame = CGRect(x: 0, y: 150, width: 150, height: 150)
        self.margaritaImage.contentMode = .scaleAspectFill
        self.view.addSubview(self.margaritaImage)
        
        self.margaritaLabel.frame = CGRect(x: 170, y: 210, width: 150, height: 30)
        self.margaritaLabel.text = "Маргарита"
        self.margaritaLabel.font = .systemFont(ofSize: 20)
        self.margaritaLabel.textColor = .black
        self.margaritaLabel.backgroundColor = .white
        self.view.addSubview(margaritaLabel)
        
        self.margaritaButton.frame = CGRect(x: 320, y: 208, width: 40, height: 40)
        self.margaritaButton.setBackgroundImage(UIImage(systemName: "plus.app.fill"), for: .normal)
        self.margaritaButton.tintColor = .systemGreen
        self.margaritaButton.tag = 1
        self.margaritaButton.addTarget(self, action: #selector(tochosenPizzaController), for: .touchUpInside)
        self.view.addSubview(margaritaButton)
        
        self.pepperoniImage.frame = CGRect(x: 5, y: 350, width: 150, height: 150)
        self.pepperoniImage.contentMode = .scaleAspectFill
        self.view.addSubview(self.pepperoniImage)

        self.pepperoniLabel.frame = CGRect(x: 170, y: 410, width: 150, height: 30)
        self.pepperoniLabel.text = "Пепперони"
        self.pepperoniLabel.textColor = .black
        self.pepperoniLabel.backgroundColor = .white
        self.pepperoniLabel.font = .systemFont(ofSize: 20)
        self.view.addSubview(pepperoniLabel)
        
        self.peperoniButton.frame = CGRect(x: 320, y: 408, width: 40, height: 40)
        self.peperoniButton.setBackgroundImage(UIImage(systemName: "plus.app.fill"), for: .normal)
        self.peperoniButton.tintColor = .systemGreen
        peperoniButton.tag = 2
        self.peperoniButton.addTarget(self, action: #selector(tochosenPizzaController), for: .touchUpInside)
        self.view.addSubview(peperoniButton)
    }
    
    //MARK: - Public methods
    @objc func tochosenPizzaController(sender: UIButton) {
        let fourthVC = chosenPizzaController()
        
        switch sender.tag {
        case 1:
            fourthVC.pizzaName = "маргарита"
        case 2:
            fourthVC.pizzaName = "пепперони"
        default:
            break
        }
        present(fourthVC, animated: true) {
            self.view.isHidden = true
        }
        }

}
