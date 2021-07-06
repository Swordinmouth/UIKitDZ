//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Valery on 22.06.2021.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Private properties
    
    // MARK: - barImage
    private var barImage = UIImage(systemName: "plus.message.fill")
    // MARK: - wordImage
    private var wordImage = UIImage(systemName: "rectangle.and.pencil.and.ellipsis")
    // MARK: - wordLabel
    private var wordLabel = UILabel()
    // MARK: - colorLabel
    private var colorLabel = UILabel()
    // MARK: - colorPicker
    private var colorPicker = UIPickerView()
    // MARK: - fontLabel
    private var fontLabel = UILabel()
    // MARK: - fontPicker
    private var fontPicker = UIPickerView()
    // MARK: - sizeSlider
    private var sizeSlider = UISlider()
    // MARK: - linesLabel
    private var linesLabel = UILabel()
    // MARK: - linesPicker
    private var linesPicker = UIPickerView()
    // MARK: - shadowsLabel
    private var shadowsLabel = UILabel()
    // MARK: - shadowsSwitch
    private var shadowsSwitch = UISwitch()

    // MARK: - Data source for colorPickerView
    private var colorArray = ["Зеленый", "Желтый", "Красный", "Черный", "Березовый", "Серый", "Розовый"]
    // MARK: - Data source for fontPickerView
    private var fontArray = ["Arial", "Helvetica", "Bradley Hand", "Optima", "Papyrus", "Times New Roman", "Zapfino"]
    // MARK: - Data source for linesPickerView
    private var linesArray = ["1", "2", "3", "4", "5", "6", "7"]
    
    // MARK: - font for label
    private var currentFont = "Arial"
    // MARK: - textsize for label
    private var currentTextSize: CGFloat = 15.0
            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Word changer"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: barImage, style: .plain, target: self, action: #selector(enterWord))
        
        // MARK: - tabBarItem
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Вводим слово", image: wordImage, tag: 0)
        self.tabBarItem = tabBarItem
        
        // MARK: - wordLabel
        wordLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        wordLabel.text = "Тут будет ваше слово"
        wordLabel.textAlignment = .center
        wordLabel.center = self.view.center
        self.view.addSubview(wordLabel)
        
        // MARK: - sizeSlider
        sizeSlider.frame = CGRect(x: 50, y: 250, width: 300, height: 10)
        sizeSlider.thumbTintColor = .cyan
        sizeSlider.tintColor = .lightGray
        sizeSlider.minimumValue = 0
        sizeSlider.maximumValue = 100
        sizeSlider.value = 10
        sizeSlider.addTarget(self, action: #selector(sizeChanged(sender:)), for: .valueChanged)
        self.view.addSubview(sizeSlider)
        
        // MARK: - colorLabel
        colorLabel.frame = CGRect(x: 0, y: 570, width: 200, height: 50)
        colorLabel.text = "Выбрать цвет 🟢"
        colorLabel.textAlignment = .center
        self.view.addSubview(colorLabel)

        // MARK: - colorPicker
        colorPicker.frame = CGRect(x: 15, y: 600, width: 150, height: 50)
        self.view.addSubview(colorPicker)
        
        // MARK: - linesLabel
        linesLabel.frame = CGRect(x: 200, y: 570, width: 200, height: 50)
        linesLabel.text = "Количество строк 🔤"
        linesLabel.textAlignment = .center
        self.view.addSubview(linesLabel)
        
        // MARK: - linesPicker
        linesPicker.frame = CGRect(x: 215, y: 600, width: 150, height: 50)
        self.view.addSubview(linesPicker)
        
        // MARK: - fontLabel
        fontLabel.frame = CGRect(x: 0, y: 670, width: 200, height: 50)
        fontLabel.text = "Выбрать шрифт"
        fontLabel.textAlignment = .center
        self.view.addSubview(fontLabel)
        
        // MARK: - fontPicker
        fontPicker.frame = CGRect(x: 15, y: 700, width: 150, height: 50)
        self.view.addSubview(fontPicker)
        
        // MARK: - shadowsLabel
        shadowsLabel.frame = CGRect(x: 200, y: 670, width: 200, height: 50)
        shadowsLabel.text = "Включить тени?"
        shadowsLabel.textAlignment = .center
        self.view.addSubview(shadowsLabel)
        
        // MARK: - shadowsSwitch
        shadowsSwitch.frame = CGRect(x: 270, y: 712, width: 0, height: 0)
        shadowsSwitch.addTarget(self, action: #selector(switchShadows(sender:)), for: .valueChanged)
        self.view.addSubview(shadowsSwitch)

        // MARK: - sign up for UIPIcker extensions
        colorPicker.dataSource = self
        colorPicker.delegate = self
        linesPicker.dataSource = self
        linesPicker.delegate = self
        fontPicker.dataSource = self
        fontPicker.delegate = self
    }
    
    
    //MARK: - Private methods
    
    //MARK: - method to change size with sizeSlider
    @objc private func sizeChanged(sender: UISlider) {
        wordLabel.font = UIFont(name: currentFont, size: CGFloat(Int(sender.value)))
    }
    
    //MARK: - method to enable or disable shadow using shadowsSwitch
    @objc private func switchShadows(sender: UISwitch) {
        if shadowsSwitch.isOn {
        wordLabel.shadowColor = .black
        wordLabel.shadowOffset = CGSize(width: 3, height: 2)
        } else {
            wordLabel.shadowColor = .black
            wordLabel.shadowOffset = CGSize(width: 0, height: 0)
        }
    }

    //MARK: - alert for rightBarButtonItem
    @objc private func enterWord() {
        let alertController = UIAlertController(title: "Пожалуйста, введите ваше слово", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ввести", style: .default) { (action) in
            let text = alertController.textFields?.first?.text
            self.wordLabel.text = text
        }
        alertController.addAction(action)
        alertController.addTextField(configurationHandler: nil)
        self.present(alertController, animated: true, completion: nil)
    }
}


//MARK: - extension for UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        colorArray.count
    }
}

//MARK: - extension for UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case colorPicker:
            return colorArray[row]
        case linesPicker:
            return linesArray[row]
        case fontPicker:
            return fontArray[row]
        default: break
        }
        return ""
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case colorPicker:
            switch row {
            case 0:
                wordLabel.textColor = .green
            case 1:
                wordLabel.textColor = .yellow
            case 2:
                wordLabel.textColor = .red
            case 3:
                wordLabel.textColor = .black
            case 4:
                wordLabel.textColor = .cyan
            case 5:
                wordLabel.textColor = .gray
            case 6:
                wordLabel.textColor = .systemPink
            default: break
            }
        case linesPicker:
            switch row {
            case 0:
                wordLabel.numberOfLines = 1
            case 1:
                wordLabel.numberOfLines = 2
            case 2:
                wordLabel.numberOfLines = 3
            case 3:
                wordLabel.numberOfLines = 4
            case 4:
                wordLabel.numberOfLines = 5
            case 5:
                wordLabel.numberOfLines = 6
            case 6:
                wordLabel.numberOfLines = 7
            default: break
            }
        case fontPicker:
            switch row {
            case 0:
                wordLabel.font = UIFont(name: "Arial", size: CGFloat(sizeSlider.value))
                currentFont = "Arial"
            case 1:
                wordLabel.font = UIFont(name: "Helvetica", size: CGFloat(sizeSlider.value))
                currentFont = "Helvetica"
            case 2:
                wordLabel.font = UIFont(name: "Bradley Hand", size: CGFloat(sizeSlider.value))
                currentFont = "Bradley Hand"
            case 3:
                wordLabel.font = UIFont(name: "Optima", size: CGFloat(sizeSlider.value))
                currentFont = "Optima"
            case 4:
                wordLabel.font = UIFont(name: "Papyrus", size: CGFloat(sizeSlider.value))
                currentFont = "Papyrus"
            case 5:
                wordLabel.font = UIFont(name: "Times New Roman", size: CGFloat(sizeSlider.value))
                currentFont = "Times New Roman"
            case 6:
                wordLabel.font = UIFont(name: "Zapfino", size: CGFloat(sizeSlider.value))
                currentFont = "Zapfino"
            default: break
            }
        default:
            break
        }
    }
}
