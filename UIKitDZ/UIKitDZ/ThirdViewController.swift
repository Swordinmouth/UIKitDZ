//
//  ThirdViewController.swift
//  UIKitDZ
//
//  Created by Valery on 26.06.2021.
//

import UIKit

class ThirdViewController: UIViewController {

    //MARK: - 3 По нажатию на кнопку + попадаем на третий экран. Дата, возраст, пол - пикеры. Instagram - алертКонтроллер.
    
    //MARK: - верхняя часть интерфейса
    let cancelLabel = UILabel()
    let addLabel = UILabel()
    let contactImage = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
    let changePhotoLabel = UILabel()
    
    //MARK: - интерфейс для имени
    let nameLabel = UILabel()
    let nameTextLabel = UITextField()
    let nameView = UIView()
    
    //MARK: - интерфейс для даты
    let dateLabel = UILabel()
    let dateText = UITextField()
    let dateView = UIView()
    let datePicker = UIDatePicker()
    
    //MARK: - интерфейс для возраста
    let ageLabel = UILabel()
    let ageText = UITextField()
    let ageview = UIView()
    let agePicker = UIPickerView()
    
    //MARK: - интерфейс для пола
    let sexLabel = UILabel()
    let sexText = UITextField()
    let sexView = UIView()
    let sexPicker = UIPickerView()
    let sexArray = ["Мужчина", "Женщина"]
    
    //MARK: - интерфейс для инсты
    let instaLabel = UILabel()
    let instaText = UITextField()
    let instView = UIView()
    
    
    

    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        cancelLabel.frame = CGRect(x: 10, y: 30, width: 150, height: 50)
        cancelLabel.text = "Отмена"
        cancelLabel.font = .systemFont(ofSize: 30)
        cancelLabel.textColor = .blue
        cancelLabel.backgroundColor = .white
        self.view.addSubview(cancelLabel)
        
        addLabel.frame = CGRect(x: 270, y: 30, width: 150, height: 50)
        addLabel.text = "Добавить"
        addLabel.font = .systemFont(ofSize: 30)
        addLabel.textColor = .blue
        addLabel.backgroundColor = .white
        self.view.addSubview(addLabel)
        
        contactImage.frame = CGRect(x: 155, y: 120, width: 100, height: 100)
        self.view.addSubview(contactImage)
        
        changePhotoLabel.frame = CGRect(x: 135, y: 215, width: 200, height: 50)
        changePhotoLabel.text = "Изменить фото"
        changePhotoLabel.font = .systemFont(ofSize: 20)
        changePhotoLabel.textColor = .blue
        changePhotoLabel.backgroundColor = .white
        self.view.addSubview(changePhotoLabel)
        
        nameLabel.frame = CGRect(x: 50, y: 260, width: 200, height: 50)
        nameLabel.text = "Имя"
        nameLabel.font = .systemFont(ofSize: 15)
        nameLabel.backgroundColor = .white
        nameLabel.textColor = .blue
        self.view.addSubview(nameLabel)
        
        nameTextLabel.frame = CGRect(x: 50, y: 290, width: 200, height: 50)
        nameTextLabel.placeholder = "Введите имя"
        self.view.addSubview(nameTextLabel)
        
        nameView.frame = CGRect(x: 50, y: 330, width: 200, height: 1)
        nameView.backgroundColor = .gray
        self.view.addSubview(nameView)
        
        dateLabel.frame = CGRect(x: 50, y: 350, width: 200, height: 50)
        dateLabel.text = "Дата"
        dateLabel.font = .systemFont(ofSize: 15)
        dateLabel.textColor = .blue
        dateLabel.backgroundColor = .white
        self.view.addSubview(dateLabel)
        
        dateText.frame = CGRect(x: 50, y: 380, width: 200, height: 50)
        dateText.placeholder = "Введите дату"
        self.view.addSubview(dateText)
        
        dateView.frame = CGRect(x: 50, y: 430, width: 200, height: 1)
        dateView.backgroundColor = .gray
        self.view.addSubview(dateView)
        
        ageLabel.frame = CGRect(x: 50, y: 440, width: 200, height: 50)
        ageLabel.text = "Возраст"
        ageLabel.font = .systemFont(ofSize: 15)
        ageLabel.textColor = .blue
        ageLabel.backgroundColor = .white
        self.view.addSubview(ageLabel)
        
        ageText.frame = CGRect(x: 50, y: 470, width: 200, height: 50)
        ageText.placeholder = "Добавить"
        self.view.addSubview(ageText)
        
        ageview.frame = CGRect(x: 50, y: 520, width: 200, height: 1)
        ageview.backgroundColor = .gray
        self.view.addSubview(ageview)
        
        sexLabel.frame = CGRect(x: 50, y: 530, width: 200, height: 50)
        sexLabel.text = "Пол"
        sexLabel.font = .systemFont(ofSize: 15)
        sexLabel.textColor = .blue
        sexLabel.backgroundColor = .white
        self.view.addSubview(sexLabel)
        
        sexText.frame = CGRect(x: 50, y: 560, width: 200, height: 50)
        sexText.placeholder = "Добавить"
        self.view.addSubview(sexText)
        
        sexView.frame = CGRect(x: 50, y: 610, width: 200, height: 1)
        sexView.backgroundColor = .gray
        self.view.addSubview(sexView)
        
        instaLabel.frame = CGRect(x: 50, y: 640, width: 200, height: 50)
        instaLabel.text = "Instagram"
        instaLabel.font = .systemFont(ofSize: 15)
        instaLabel.textColor = .blue
        instaLabel.backgroundColor = .white
        self.view.addSubview(instaLabel)
        
        instaText.frame = CGRect(x: 50, y: 670, width: 200, height: 50)
        instaText.placeholder = "Добавить"
        self.view.addSubview(instaText)
        self.instaText.addTarget(self, action: #selector(alert), for: .editingDidBegin)

        
        instView.frame = CGRect(x: 50, y: 720, width: 200, height: 1)
        instView.backgroundColor = .gray
        self.view.addSubview(instView)
        
        crateDatePicker()
        
        agePicker.delegate = self
        agePicker.dataSource = self

        sexPicker.delegate = self
        sexPicker.dataSource = self
        
        ageText.inputView = agePicker
        sexText.inputView = sexPicker
    }
    

    // Метод из видоса, который ты скидывал
    func crateDatePicker() {
        //prefered style
        datePicker.preferredDatePickerStyle = .wheels
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        //assign toolbar
        dateText.inputAccessoryView = toolbar
        
        //assign datePicker to textField
        dateText.inputView = datePicker
        
        //datePicker mode
        datePicker.datePickerMode = .date
    }
    @objc func donePressed() {
        //formater
        let formater = DateFormatter()
        formater.dateStyle = .medium
        formater.timeStyle = .none
        
        dateText.text = formater.string(from: datePicker.date)
        self.view.endEditing(true)
    }

    
    
    @objc func alert() {
             let alertController = UIAlertController(title: "Введите Username Instagram", message: nil, preferredStyle: .alert)
             let alertOne = UIAlertAction(title: "Cancel", style: .cancel)
             let alertTwo = UIAlertAction(title: "ok", style: .default) { action in
                 let text = alertController.textFields?.first?.text
                 self.instaText.text = text
             }

             alertController.addAction(alertOne)
             alertController.addAction(alertTwo)
             alertController.addTextField { textField in
             textField.placeholder = "Например Яша_Лава_2021"
             }
             self.present(alertController, animated: true, completion: nil)
         }
    
}

extension ThirdViewController: UIPickerViewDataSource {
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
     }

     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         if pickerView == agePicker {
             return 100
         } else if pickerView == sexPicker {
             return 2
         }
        return 0
     }
 }


extension ThirdViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
             if pickerView == agePicker {
                 let result = "\(row)"
                 return result

             } else if pickerView == sexPicker {
                return sexArray[row]
             }

             return ""
         }
    
}
