//
//  ThirdViewController.swift
//  UIKitDZ
//
//  Created by Valery on 28.06.2021.
//

import UIKit
import AVFoundation

class ThirdViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var timer = Timer()
    
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var sliderBoard: UISlider!
    @IBOutlet weak var timerLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderBoard.value = 0.0
        sliderBoard.maximumValue = Float((player.duration))
        
        timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(updatingSlider), userInfo: nil, repeats: true)
        
        do {
             if let audioPath = Bundle.main.path(forResource: "Король и Шут - Лесник", ofType: "mp3") {
                 try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
             }
         } catch {
             print("Error")
         }
        
    }
  
    @IBAction func sliderBoardAction(_ sender: Any) {
        sliderBoard.maximumValue = Float(player.duration)
        player.currentTime = TimeInterval(sliderBoard.value)
        player.prepareToPlay()
    }
    
    @IBAction func updatingSlider(_ sender: Any) {
        sliderBoard.value = Float(player.currentTime)
        timerLable.text = ("\(Int(player.currentTime) / 60):\(Int(player.currentTime) % 60)")
    }
    
    @IBAction func playButton(_ sender: Any) {
        self.player.play()

    }
    
    @IBAction func pauseButton(_ sender: Any) {
        self.player.pause()

    }
}
