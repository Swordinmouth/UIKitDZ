//
//  TimerController.swift
//  UIKitDZ
//
//  Created by Valery on 22.06.2021.
//

import UIKit

final class TimerController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet private var timerUILable: UILabel!
    @IBOutlet private var startStopUIButton: UIButton!
    @IBOutlet private var resetUIButton: UIButton!

    //MARK: - Private Properties
    private var timer = Timer()
    private var counting = 0
    private var timerCounting = true


    //MARK: - IBAction
    @IBAction private func startStopActionButton(_ sender: Any) {
        if timerCounting {
            timerCounting = false
            startStopUIButton.setImage(UIImage(systemName: "timer"), for: .normal)
            timer.invalidate()
        } else {
            timerCounting = true
            startStopUIButton.setImage(UIImage(systemName: "stopwatch.fill"), for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    @IBAction private func resetActionButton(_ sender: Any) {
        counting = 0
        timer.invalidate()
        timerUILable.text = makeTimeString(hours: 0, minutes: 0, seconds: 0)
        startStopUIButton.setImage(UIImage(systemName: "timer"), for: .normal)
    }


    //MARK: - Private Methods
    @objc private func timerCounter() {
        counting = counting + 1
        let time = timerRunning(seconds: counting)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timerUILable.text = timeString
    }
    private func timerRunning(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    private func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
}

