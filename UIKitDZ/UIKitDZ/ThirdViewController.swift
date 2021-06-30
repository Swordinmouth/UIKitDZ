//
//  ThirdViewController.swift
//  UIKitDZ
//
//  Created by Valery on 30.06.2021.
//

import UIKit

class ThirdViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var yoursSkeleton: UIImageView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sexPicker: UIPickerView!
    @IBOutlet weak var sexLabel: UILabel!
    
    // MARK: - Public Properties
    var activityViewController: UIActivityViewController? = nil
    var yoursSkeleton2 = UIImage()
    private let sexArray = ["Скелет мужик", "Скелет дама"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yoursSkeleton.image = yoursSkeleton2
        
        //Mark: - delegate for sexPicker
        sexPicker.dataSource = self
        sexPicker.delegate = self
        
        //Mark: - delegete for textField
        self.nameTextField.delegate = self
    }
    
    
    // MARK: - IBAction
    @IBAction func shareButtonActivity(_ sender: Any) {
        let text = self.nameTextField.text
        let image = yoursSkeleton2
        let label = sexLabel
        if text?.count == 0 {
            let message = "Сначала введите текст, потом нажмите кнопку"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        self.activityViewController = UIActivityViewController(activityItems: [self.nameTextField.text ?? "nil", image, label?.text], applicationActivities: nil)
        self.present(self.activityViewController!, animated: true, completion: nil)
    }
}


//MARK: - pickerView
extension ThirdViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sexArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sexLabel.text = sexArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        sexArray[row]
    }
}

//MARK: - extension for textField

extension ThirdViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.nameTextField.resignFirstResponder()
        
        return true
    }
}
