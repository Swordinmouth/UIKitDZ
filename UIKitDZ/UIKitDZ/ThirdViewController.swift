//
//  ThirdViewController.swift
//  UIKitDZ
//
//  Created by Valery on 29.06.2021.
//

import UIKit

class ThirdViewController: UIViewController {

    var firstString = "qwe"
    var curentBookImage = UIImageView()
    var thirdViewControllerImage = UIImage()
    var slider = UISlider()
    var capchaLabel = UILabel()
    var notificationLabel = UILabel()
    var cartLabel = UILabel()
    var mailSwitch = UISwitch()
    var packingLabel = UILabel()
    var packingSwitch = UISwitch()
    var doneButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.cartLabel.frame = CGRect(x: 45, y: 50, width: 330, height: 20)
        self.cartLabel.text = "Корзина"
        self.cartLabel.textAlignment = .center
        self.cartLabel.font = .systemFont(ofSize: 20)
        self.cartLabel.backgroundColor = .white
        self.cartLabel.textColor = .black
        self.view.addSubview(cartLabel)
        
        self.curentBookImage.frame = CGRect(x: 130, y: 120, width: 150, height: 210)
        self.curentBookImage.image = thirdViewControllerImage
        self.view.addSubview(self.curentBookImage)
                
        self.slider.frame = CGRect(x: 35, y: 450, width: 350, height: 20)
        self.view.addSubview(slider)

        self.capchaLabel.frame = CGRect(x: 45, y: 420, width: 330, height: 20)
        self.capchaLabel.text = "Потяните слайдер, если вы не робот 🤖"
        self.capchaLabel.textAlignment = .center
        self.capchaLabel.font = .systemFont(ofSize: 17)
        self.capchaLabel.backgroundColor = .white
        self.capchaLabel.textColor = .black
        self.view.addSubview(capchaLabel)
        
        self.notificationLabel.frame = CGRect(x: 45, y: 520, width: 250, height: 20)
        self.notificationLabel.text = "Уведомлять о скидках? 📪"
        self.notificationLabel.font = .systemFont(ofSize: 17)
        self.notificationLabel.backgroundColor = .white
        self.notificationLabel.textColor = .black
        self.view.addSubview(notificationLabel)
        
        self.mailSwitch.frame = CGRect(x: 330, y: 515, width: 0, height: 0)
        self.view.addSubview(mailSwitch)
        
        self.packingLabel.frame = CGRect(x: 45, y: 560, width: 250, height: 20)
        self.packingLabel.text = "Упаковать товар?"
        self.packingLabel.font = .systemFont(ofSize: 17)
        self.packingLabel.backgroundColor = .white
        self.packingLabel.textColor = .black
        self.view.addSubview(packingLabel)
        
        self.packingSwitch.frame = CGRect(x: 330, y: 555, width: 0, height: 0)
        self.view.addSubview(packingSwitch)
        
   
        self.doneButton.frame = CGRect(x: 55, y: 650, width: 300, height: 50)
        self.doneButton.setTitle("Доставить", for: .normal)
        self.doneButton.layer.cornerRadius = 10
        self.doneButton.backgroundColor = .systemPink
        self.doneButton.addTarget(self, action: #selector(okWeAreDone), for: .touchUpInside)
        self.view.addSubview(doneButton)
        
        
    }

    @objc func okWeAreDone() {
        let alertController = UIAlertController(title: "Спасибо за покупку!", message: "Мы уже собираем ваш заказ", preferredStyle: .alert)
        let action = UIAlertAction(title: "Отлично", style: .cancel) { (action) in
        }
    
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)

    }
    
  

}
