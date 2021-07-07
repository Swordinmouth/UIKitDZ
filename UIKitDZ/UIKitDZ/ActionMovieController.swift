//
//  ActionMovieController.swift
//  UIKitDZ
//
//  Created by Valery on 07.07.2021.
//

import UIKit

final class ActionMovieController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var languagePicker: UIPickerView!
    @IBOutlet weak var subtitlesPicker: UIPickerView!
    @IBOutlet weak var playButton: UIButton!

    // MARK: - private properties
    private var language = ["Русский", "Английский", "Немецкий", "Украинский"]
    private var subtitles = ["Русский", "Английский", "Немецкий", "Украинский"]

    override func viewDidLoad() {
        super.viewDidLoad()

        playButton.addTarget(self, action: #selector(getter: playButton), for: .valueChanged)

        languagePicker.dataSource = self
        languagePicker.delegate = self
        subtitlesPicker.dataSource = self
        subtitlesPicker.delegate = self
    }

    // MARK: - IBAction
    @IBAction func playButton(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Сначала купи подписку", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Хорошо", style: .default) { (action) in

        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        }

    @IBAction func logOutButton(_ sender: UIBarButtonItem) {
        UserDefaults.standard.removeObject(forKey: "isRegistration")
        dismiss(animated: true)
    }
}

//MARK: - extension for UIPickerViewDataSource
extension ActionMovieController: UIPickerViewDataSource {
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         1
     }

     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         language.count
     }
 }

//MARK: - extension for UIPickerViewDelegate
extension ActionMovieController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case languagePicker:
            return language[row]
        case subtitlesPicker:
            return subtitles[row]
        default: break
        }
        return ""
    }
}
