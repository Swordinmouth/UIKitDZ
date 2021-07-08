//
//  FreeBookFragmentController.swift
//  UIKitDZ
//
//  Created by Valery on 08.07.2021.
//

import UIKit

final class FreeFragmentController: UIViewController {

    //MARK: - Visual Components
    private var freeFragment = UITextView()
    private var fontPicker = UIPickerView()
    private var fontsLabel = UILabel()
    private var sizeLabel = UILabel()
    private var minSizeButton = UIButton()
    private var maxSizeButton = UIButton()
    private var nightModeLabel = UILabel()
    private var nightMode = UISwitch()
    private var textColor = UILabel()
    private var firstColor = UIButton()
    private var secondColor = UIButton()
    private var thirdColor = UIButton()
    private var fourthColor = UIButton()
    private var shareImage = UIImage(systemName: "arrowshape.turn.up.forward.fill")
    private var shareButton = UIButton()
    private var sizeSlider = UISlider()


    //MARK: - Private Properties
    private var fonts = ["Bradley Hand", "Papyrus", "Times New Roman", "Zapfino"]
    private var curentFont = "Arial"
    private var curentSize: CGFloat = 15
    private var weight = 0.15


    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: - Initializers
        createTextView()
        createFontPicker()
        createFontsLable()
        createSizeLabel()
        createMinSizeButton()
        createMaxSizeButton()
        createNightModeLabel()
        createNightMode()
        createTextColor()
        createColorButtons()
        createShareButton()
        createSizeSlider()

        fontPicker.dataSource = self
        fontPicker.delegate = self
    }

    //MARK: - Private Methods
   private func createTextView() {
    freeFragment.frame = CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: view.bounds.height / 2)
    freeFragment.text = """
In these influential dialogues—Euthyphro, Apology, Crito, Meno, Phaedo, Symposium—Plato employs the dialectic method to
examine the trial and death of his mentor, Socrates, and address the eternal questions of human existence.

THIS ENRICHED CLASSIC EDITION INCLUDES:

• A concise introduction that gives the reader important background information

• A chronology of the author’s life and work

• A timeline of significant events that provides the book’s historical context

• An outline of key themes and plot points to guide the reader’s own interpretations

• Detailed explanatory notes

• Critical analysis and modern perspectives on the work

• Discussion questions to promote lively classroom and book group interaction

• A list of recommended related books and films to broaden the reader’s experience
"""
    freeFragment.backgroundColor = .white
//    freeFragment.font = UIFont(name: curentFont, size: curentSize)
//    freeFragment.font = .systemFont(ofSize: curentSize, weight: UIFont.Weight.init(CGFloat(weight)))
    freeFragment.isEditable = false
    maxSizeButton.addTarget(self, action: #selector(changeWeight(sender:)), for: .valueChanged)

    view.addSubview(freeFragment)
    }

    private func createFontPicker() {
        fontPicker.frame = CGRect(x: 150, y: 700, width: 250, height: 50)
        view.addSubview(fontPicker)
    }

    private func createFontsLable() {
        fontsLabel.frame = CGRect(x: 15, y: 700, width: 250, height: 50)
        fontsLabel.text = "Chose text font"
        fontsLabel.font = fontsLabel.font.withSize(20)
        view.addSubview(fontsLabel)
    }

    private func createSizeLabel() {
        sizeLabel.frame = CGRect(x: 15, y: 750, width: 250, height: 50)
        sizeLabel.text = "Chose text size"
        sizeLabel.font = sizeLabel.font.withSize(20)
        view.addSubview(sizeLabel)
    }

    private func createMinSizeButton() {
        minSizeButton.frame = CGRect(x: 200, y: 765, width: 20, height: 20)
        minSizeButton.setTitle("a", for: .normal)
        minSizeButton.setTitleColor(.orange, for: .normal)
        minSizeButton.addTarget(self, action: #selector(changeWeight(sender:)), for: .touchUpInside)
        view.addSubview(minSizeButton)
    }

    private func createMaxSizeButton() {
        maxSizeButton.frame = CGRect(x: 330, y: 765, width: 20, height: 20)
        maxSizeButton.setTitle("A", for: .normal)
        maxSizeButton.setTitleColor(.orange, for: .normal)
        maxSizeButton.addTarget(self, action: #selector(changeWeight(sender:)), for: .touchUpInside)
        view.addSubview(maxSizeButton)
    }

    private func createNightModeLabel() {
        nightModeLabel.frame =  CGRect(x: 15, y: 800, width: 250, height: 50)
        nightModeLabel.text = "Night mode"
        nightModeLabel.font = nightModeLabel.font.withSize(20)
        view.addSubview(nightModeLabel)
    }

    private func createNightMode() {
        nightMode.frame = CGRect(x: 300, y: 810, width: 0, height: 0)
        nightMode.isOn = false
        nightMode.addTarget(self, action: #selector(changeNightMode), for: .valueChanged)
        view.addSubview(nightMode)
    }

    private func createTextColor() {
        textColor.frame = CGRect(x: 15, y: 600, width: 250, height: 50)
        textColor.text = "Text color"
        textColor.font = nightModeLabel.font.withSize(20)
        view.addSubview(textColor)
    }

    private func createColorButtons() {
        firstColor.frame = CGRect(x: 150, y: 600, width: 50, height: 50)
        firstColor.layer.cornerRadius = 25
        firstColor.backgroundColor = .black
        firstColor.tag = 0
        firstColor.addTarget(self, action: #selector(changeTextColor(sender:)), for: .touchUpInside)
        view.addSubview(firstColor)

        secondColor.frame = CGRect(x: 210, y: 600, width: 50, height: 50)
        secondColor.layer.cornerRadius = 25
        secondColor.backgroundColor = .systemPink
        secondColor.tag = 1
        secondColor.addTarget(self, action: #selector(changeTextColor(sender:)), for: .touchUpInside)
        view.addSubview(secondColor)

        thirdColor.frame = CGRect(x: 270, y: 600, width: 50, height: 50)
        thirdColor.layer.cornerRadius = 25
        thirdColor.backgroundColor = .cyan
        thirdColor.tag = 2
        thirdColor.addTarget(self, action: #selector(changeTextColor(sender:)), for: .touchUpInside)
        view.addSubview(thirdColor)

        fourthColor.frame = CGRect(x: 330, y: 600, width: 50, height: 50)
        fourthColor.layer.cornerRadius = 25
        fourthColor.backgroundColor = .magenta
        fourthColor.tag = 3
        fourthColor.addTarget(self, action: #selector(changeTextColor(sender:)), for: .touchUpInside)
        view.addSubview(fourthColor)
    }

    private func createShareButton() {
        shareButton.frame =  CGRect(x: 340, y: 50, width: 50, height: 50)
        shareButton.setImage(shareImage, for: .normal)
        shareButton.tintColor = .black
        shareButton.addTarget(self, action: #selector(share), for: .touchUpInside)
        view.addSubview(shareButton)
    }

    private func createSizeSlider() {
        sizeSlider.frame = CGRect(x: 15, y: 560, width: 380, height: 10)
        sizeSlider.thumbTintColor = .cyan
        sizeSlider.minimumValue = 0
        sizeSlider.maximumValue = 100
        sizeSlider.value = 10
        sizeSlider.addTarget(self, action: #selector(sizeChanged(sender:)), for: .valueChanged)
        self.view.addSubview(sizeSlider)
    }

    @objc private func changeWeight(sender: UIButton) {
        switch sender {
        case minSizeButton:
            weight -= 0.15
        case maxSizeButton:
            weight += 0.15
        default:
            return
        }
        freeFragment.font = UIFont.systemFont(ofSize: freeFragment.font?.pointSize ?? 15, weight: UIFont.Weight
                                                .init(CGFloat(weight)))
    }

    @objc private func changeNightMode(sender: UISwitch) {
         switch sender.isOn {
         case true:
            view.backgroundColor = .black
            freeFragment.backgroundColor = .black
            freeFragment.textColor = .white
            fontsLabel.textColor = .white
            sizeLabel.textColor = .white
            nightModeLabel.textColor = .white
            fontPicker.backgroundColor = .white
            textColor.textColor = .white
         case false:
            view.backgroundColor = .white
            freeFragment.backgroundColor = .white
            freeFragment.textColor = .black
            fontsLabel.textColor = .black
            sizeLabel.textColor = .black
            nightModeLabel.textColor = .black
            fontPicker.backgroundColor = .white
            textColor.textColor = .black
         }
     }

    @objc private func changeTextColor(sender: UIButton) {
        switch sender.tag {
        case 0:
            freeFragment.textColor = .black
        case 1:
            freeFragment.textColor = .systemPink
        case 2:
            freeFragment.textColor = .cyan
        case 3:
            freeFragment.textColor = .magenta
        default: break
        }
    }

    @objc private func share() {
        let vc = UIActivityViewController(activityItems: [freeFragment.text ?? ""], applicationActivities: nil)
        present(vc, animated: true, completion: nil)
    }

    @objc private func sizeChanged(sender: UISlider) {
        freeFragment.font = UIFont(name: curentFont, size: CGFloat(Int(sender.value)))
    }
}



//MARK: - extension for UIPickerViewDataSource
extension FreeFragmentController: UIPickerViewDataSource {
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return fonts.count
     }

     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
     }

     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return fonts[row]
     }
 }

//MARK: - extension for UIPickerViewDelegate
extension FreeFragmentController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch fonts[row] {
        case "Bradley Hand":
            freeFragment.font = UIFont(name: "Bradley Hand", size: freeFragment.font?.pointSize ?? 15)
            curentFont = "Bradley Hand"
        case "Papyrus":
            freeFragment.font = UIFont(name: "Papyrus", size: freeFragment.font?.pointSize ?? 15)
            curentFont = "Papyrus"
        case "Times New Roman":
            freeFragment.font = UIFont(name: "Times New Roman", size: freeFragment.font?.pointSize ?? 15)
            curentFont = "Times New Roman"
        case "Zapfino":
            freeFragment.font = UIFont(name: "Zapfino", size: freeFragment.font?.pointSize ?? 15)
            curentFont = "Zapfino"
        default: break
        }
    }
}

