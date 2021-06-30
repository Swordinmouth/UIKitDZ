//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Valery on 30.06.2021.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var skeletonImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func skeletDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            skeletonImage.image = UIImage(named: "счастливый")
        case 1:
            skeletonImage.image = UIImage(named: "рефлексия")
        case 2:
            skeletonImage.image = UIImage(named: "злой")
        default:
            break
        }

    }
    
    @IBAction func showThirdVCAction(_ sender: UIButton) {
        guard let image = skeletonImage.image else { return }
        performSegue(withIdentifier: "showthirdvc", sender: image)
    }
    
    
    // Mark: - Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ThirdViewController else {
            return
        }
        destination.yoursSkeleton2 = sender as! UIImage
    }

    
}
