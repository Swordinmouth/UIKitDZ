//
//  FreeBookFragmentController.swift
//  UIKitDZ
//
//  Created by Valery on 08.07.2021.
//

import UIKit

final class FreeFragmentController: UIViewController {

    //MARK: - Visual Components
    private var freeFragmentTextView = UITextView()
    private var fontUIPIckerView = UIPickerView()
    private var fontsUILabel = UILabel()
    private var sizeUILabel = UILabel()
    private var minSizeUIButton = UIButton()
    private var maxSizeUIButton = UIButton()
    private var nightModeUILabel = UILabel()
    private var nightModeUISwitch = UISwitch()
    private var textColorUILabel = UILabel()
    private var firstColorUIButton = UIButton()
    private var secondColorUIButton = UIButton()
    private var thirdColorUIButton = UIButton()
    private var fourthColorUIButton = UIButton()
    private var shareUIImage = UIImage(systemName: "arrowshape.turn.up.forward.fill")
    private var shareUIButton = UIButton()
    private var sizeUISlider = UISlider()


    //MARK: - Private Properties
    private var fonts = ["Bradley Hand", "Papyrus", "Times New Roman", "Zapfino"]
    private var curentFont = "Arial"
    private var curentSize: CGFloat = 15
    private var weight = 1.2
    private var colors = [UIColor.black, UIColor.systemPink, UIColor.cyan, UIColor.magenta]


    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()

        fontUIPIckerView.dataSource = self
        fontUIPIckerView.delegate = self
    }

    //MARK: - Private Methods
    private func setupViews() {
        createfreeFragmentTextView()
        createFontUIPIckerView()
        createFontsUILable()
        createSizeUILabel()
        createMinSizeUIButton()
        createMaxSizeUIButton()
        createNightModeUILabel()
        createNightModeUISwitch()
        createTextColorUILabel()
        createColorsUIButton()
        createShareUIButton()
        createSizeUISlider()
    }

    private func createfreeFragmentTextView() {

        freeFragmentTextView.frame = CGRect(x: 20, y: 100, width: view.bounds.width - 40,
                                            height: view.bounds.height / 2)
        freeFragmentTextView.text = """
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
        freeFragmentTextView.backgroundColor = view.backgroundColor
        freeFragmentTextView.isEditable = false
        maxSizeUIButton.addTarget(self, action: #selector(changeWeight(sender:)), for: .valueChanged)
        view.addSubview(freeFragmentTextView)
    }

    private func createFontUIPIckerView() {
        fontUIPIckerView.frame = CGRect(x: 150, y: 700, width: 250, height: 50)
        view.addSubview(fontUIPIckerView)
    }

    private func createFontsUILable() {
        fontsUILabel.frame = CGRect(x: 15, y: 700, width: 250, height: 50)
        fontsUILabel.text = "Choose text font"
        fontsUILabel.font = fontsUILabel.font.withSize(20)
        view.addSubview(fontsUILabel)
    }

    private func createSizeUILabel() {
        sizeUILabel.frame = CGRect(x: 15, y: 750, width: 250, height: 50)
        sizeUILabel.text = "Choose text size"
        sizeUILabel.font = sizeUILabel.font.withSize(20)
        view.addSubview(sizeUILabel)
    }

    private func createMinSizeUIButton() {
        minSizeUIButton.frame = CGRect(x: 200, y: 765, width: 20, height: 20)
        minSizeUIButton.setTitle("a", for: .normal)
        minSizeUIButton.setTitleColor(.orange, for: .normal)
        minSizeUIButton.addTarget(self, action: #selector(changeWeight(sender:)), for: .touchUpInside)
        view.addSubview(minSizeUIButton)
    }

    private func createMaxSizeUIButton() {
        maxSizeUIButton.frame = CGRect(x: 330, y: 765, width: 20, height: 20)
        maxSizeUIButton.setTitle("A", for: .normal)
        maxSizeUIButton.setTitleColor(.orange, for: .normal)
        maxSizeUIButton.addTarget(self, action: #selector(changeWeight(sender:)), for: .touchUpInside)
        view.addSubview(maxSizeUIButton)
    }

    private func createNightModeUILabel() {
        nightModeUILabel.frame =  CGRect(x: 15, y: 800, width: 250, height: 50)
        nightModeUILabel.text = "Night mode"
        nightModeUILabel.font = nightModeUILabel.font.withSize(20)
        view.addSubview(nightModeUILabel)
    }

    private func createNightModeUISwitch() {
        nightModeUISwitch.frame = CGRect(x: 300, y: 810, width: 0, height: 0)
        nightModeUISwitch.isOn = false
        nightModeUISwitch.addTarget(self, action: #selector(changeNightMode), for: .valueChanged)
        view.addSubview(nightModeUISwitch)
    }

    private func createTextColorUILabel() {
        textColorUILabel.frame = CGRect(x: 15, y: 600, width: 250, height: 50)
        textColorUILabel.text = "Text color"
        textColorUILabel.font = nightModeUILabel.font.withSize(20)
        view.addSubview(textColorUILabel)
    }

    private func createColorsUIButton() {
        firstColorUIButton.tag = 0
        firstColorUIButton.frame = CGRect(x: 150, y: 600, width: 50, height: 50)
        firstColorUIButton.layer.cornerRadius = 25
        firstColorUIButton.backgroundColor = .black
        firstColorUIButton.addTarget(self, action: #selector(changeTextColor(sender:)), for: .touchUpInside)
        view.addSubview(firstColorUIButton)

        secondColorUIButton.tag = 1
        secondColorUIButton.frame = CGRect(x: 210, y: 600, width: 50, height: 50)
        secondColorUIButton.layer.cornerRadius = 25
        secondColorUIButton.backgroundColor = .systemPink
        secondColorUIButton.addTarget(self, action: #selector(changeTextColor(sender:)), for: .touchUpInside)
        view.addSubview(secondColorUIButton)

        thirdColorUIButton.tag = 2
        thirdColorUIButton.frame = CGRect(x: 270, y: 600, width: 50, height: 50)
        thirdColorUIButton.layer.cornerRadius = 25
        thirdColorUIButton.backgroundColor = .cyan
        thirdColorUIButton.addTarget(self, action: #selector(changeTextColor(sender:)), for: .touchUpInside)
        view.addSubview(thirdColorUIButton)

        fourthColorUIButton.tag = 3
        fourthColorUIButton.frame = CGRect(x: 330, y: 600, width: 50, height: 50)
        fourthColorUIButton.layer.cornerRadius = 25
        fourthColorUIButton.backgroundColor = .magenta
        fourthColorUIButton.addTarget(self, action: #selector(changeTextColor(sender:)), for: .touchUpInside)
        view.addSubview(fourthColorUIButton)
    }

    private func createShareUIButton() {
        shareUIButton.frame =  CGRect(x: 340, y: 50, width: 50, height: 50)
        shareUIButton.setImage(shareUIImage, for: .normal)
        shareUIButton.tintColor = .black
        shareUIButton.addTarget(self, action: #selector(share), for: .touchUpInside)
        view.addSubview(shareUIButton)
    }

    private func createSizeUISlider() {
        sizeUISlider.frame = CGRect(x: 15, y: 560, width: 380, height: 10)
        sizeUISlider.thumbTintColor = .cyan
        sizeUISlider.minimumValue = 0
        sizeUISlider.maximumValue = 100
        sizeUISlider.value = 10
        sizeUISlider.addTarget(self, action: #selector(sizeChanged(sender:)), for: .valueChanged)
        self.view.addSubview(sizeUISlider)
    }

    @objc private func changeWeight(sender: UIButton) {
        switch sender {
        case minSizeUIButton:
            weight -= 0.15
        case maxSizeUIButton:
            weight += 0.15
        default:
            return
        }
        freeFragmentTextView.font = UIFont.systemFont(ofSize: freeFragmentTextView.font?.pointSize ?? 15,
                                                      weight: UIFont.Weight.init(CGFloat(weight)))
    }

    @objc private func changeNightMode(sender: UISwitch) {
        view.overrideUserInterfaceStyle = nightModeUISwitch.isOn ?  .dark : .light
        if nightModeUISwitch.isOn {
            view.backgroundColor = .black
        } else {
            view.backgroundColor = .white
        }
     }

    @objc private func changeTextColor(sender: UIButton) {
        freeFragmentTextView.textColor = colors[sender.tag]
    }

    @objc private func share() {
        let vc = UIActivityViewController(activityItems: [freeFragmentTextView.text ?? ""], applicationActivities: nil)
        present(vc, animated: true, completion: nil)
    }

    @objc private func sizeChanged(sender: UISlider) {
        freeFragmentTextView.font = UIFont(name: curentFont, size: CGFloat(Int(sender.value)))
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
        freeFragmentTextView.font = UIFont(name: fonts[row], size: CGFloat(curentSize))

    }
}

