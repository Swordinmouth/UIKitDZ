//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Valery on 22.06.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var playPauseButton: UIButton!
    
    // MARK: - Public Properties
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        //Mark: - textField
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
        
        //MARK: - song
        do {
              if let audioPath = Bundle.main.path(forResource: "mister-dudec-orginal_(mp3CC.biz)", ofType: "mp3") {
                  try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
              }
          } catch {
              print("Error")
          }
        self.player.play()
    }
    
}




//MARK: - textField
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.loginTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        return true
    }
}
