//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Valery on 29.06.2021.
//

import UIKit

class SecondViewController: UIViewController {

    var imageView = UIImageView()
    var secondImageView = UIImageView()
    var thirdImageView = UIImageView()
    var fourthImageView = UIImageView()
    
    var firstImage = UIImage()

    let coverPicker = UIPickerView()
    var coverArray = ["Твердый переплет", "Мягкая обложка"]
    
    var addButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Выбрать обложку"
        let barImage = UIImage(systemName: "cart")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: barImage, style: .plain, target: self, action: #selector(presentThirdVC))
        
        self.imageView.frame = CGRect(x: 120, y: 300, width: 150, height: 210)
        self.imageView.image = firstImage
        self.view.addSubview(self.imageView)

        
        self.coverPicker.frame = CGRect(x: 50, y: 470, width: 300, height: 200)
        self.view.addSubview(coverPicker)
        
        self.addButton.frame = CGRect(x: 55, y: 650, width: 300, height: 50)
        self.addButton.setTitle("Добавить в корзину", for: .normal)
        self.addButton.layer.cornerRadius = 10
        self.addButton.backgroundColor = .systemPink
        self.addButton.addTarget(self, action: #selector(aprove), for: .touchUpInside)
        self.view.addSubview(addButton)

        coverPicker.delegate = self
        coverPicker.dataSource = self
    }
    
    @objc func aprove() {
        let alertController = UIAlertController(title: "Спасибо! Ваш заказ добавлен в корзину", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Отлично", style: .cancel) { (action) in
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)

    }
    
    @objc func presentThirdVC() {
         let thirdVC = ThirdViewController()
         thirdVC.firstString = "test. adding books"
         thirdVC.thirdViewControllerImage = firstImage
         present(thirdVC, animated: true, completion: nil)
     }
}


extension SecondViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    
}

extension SecondViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == coverPicker {
            return coverArray[row]
        }
        return ""
        
    }
    
}
