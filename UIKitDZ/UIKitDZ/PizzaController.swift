//
//  ThirdViewController.swift
//  UIKitDZ
//
//  Created by Valery on 01.07.2021.
//

import UIKit

final class PizzaController: UIViewController {
    
    // MARK: - Private Properties

    //MARK: - margaritaImage
    private var margaritaImage = UIImageView(image: UIImage(named: "маргарита.jpg"))
    //MARK: - pepperoniImage
    private var pepperoniImage = UIImageView(image: UIImage(named: "пепперони.jpg"))
    //MARK: - margaritaLabel
    private var margaritaLabel = UILabel()
    //MARK: - pepperoniLabel
    private var pepperoniLabel = UILabel()
    //MARK: - margaritaButton
    private var margaritaButton = UIButton()
    //MARK: - peperoniButton
    private var peperoniButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Pizza"

        // MARK: - Visual Components
        //MARK: - margaritaImage
        margaritaImage.frame = CGRect(x: 0, y: 150, width: 150, height: 150)
        margaritaImage.contentMode = .scaleAspectFill
        view.addSubview(self.margaritaImage)
        
        //MARK: - margaritaLabel
        margaritaLabel.frame = CGRect(x: 170, y: 210, width: 150, height: 30)
        margaritaLabel.text = "Маргарита"
        margaritaLabel.font = .systemFont(ofSize: 20)
        margaritaLabel.textColor = .black
        margaritaLabel.backgroundColor = .white
        view.addSubview(margaritaLabel)
        
        //MARK: - margaritaButton
        margaritaButton.frame = CGRect(x: 320, y: 208, width: 40, height: 40)
        margaritaButton.setBackgroundImage(UIImage(systemName: "plus.app.fill"), for: .normal)
        margaritaButton.tintColor = .systemGreen
        margaritaButton.tag = 1
        margaritaButton.addTarget(self, action: #selector(tochosenPizzaController), for: .touchUpInside)
        view.addSubview(margaritaButton)
        
        //MARK: - pepperoniImage
        pepperoniImage.frame = CGRect(x: 5, y: 350, width: 150, height: 150)
        pepperoniImage.contentMode = .scaleAspectFill
        view.addSubview(self.pepperoniImage)

        //MARK: - pepperoniLabel
        pepperoniLabel.frame = CGRect(x: 170, y: 410, width: 150, height: 30)
        pepperoniLabel.text = "Пепперони"
        pepperoniLabel.textColor = .black
        pepperoniLabel.backgroundColor = .white
        pepperoniLabel.font = .systemFont(ofSize: 20)
        view.addSubview(pepperoniLabel)
        
        //MARK: - peperoniButton
        peperoniButton.frame = CGRect(x: 320, y: 408, width: 40, height: 40)
        peperoniButton.setBackgroundImage(UIImage(systemName: "plus.app.fill"), for: .normal)
        peperoniButton.tintColor = .systemGreen
        peperoniButton.tag = 2
        peperoniButton.addTarget(self, action: #selector(tochosenPizzaController), for: .touchUpInside)
        view.addSubview(peperoniButton)
    }
    
    //MARK: - Public methods
    @objc func tochosenPizzaController(sender: UIButton) {
        let fourthVC = ChosenPizzaController()
        
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
