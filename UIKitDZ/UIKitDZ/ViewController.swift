//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Valery on 22.06.2021.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func archButton(_ sender: Any) {
                let newVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
                navigationController?.pushViewController(newVC!, animated: true)
    }
    
    
    @IBAction func kishButton(_ sender: Any) {
                let newVC = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController")
                navigationController?.pushViewController(newVC!, animated: true)
            }
    
    
    
}

