//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Valery on 22.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //Segment
    var segmentControll = UISegmentedControl()
    
    //Books
    var imageView = UIImageView()
    var secondImageView = UIImageView()
    var thirdImageView = UIImageView()
    var fourthImageView = UIImageView()

    
    var storeLogoImage = UIImageView(image: UIImage(named: "лого.png"))
        
    var imageArray = [(UIImage(named: "аврелий.jpg"), UIImage(named: "заратустра.jpg"), UIImage(named: "кант.jpg"), UIImage(named: "платон.jpg")), (UIImage(named: "тошнота.jpg"), UIImage(named: "толстой.jpg"), UIImage(named: "гюго.jpg"), UIImage(named: "граф.jpg")), (UIImage(named: "оруэлл.jpg"), UIImage(named: "хаксли.jpg"), UIImage(named: "обезьяна.jpg"), UIImage(named: "брэдбери.jpg")), (UIImage(named: "онимэ.jpg"), UIImage(named: "атака титанов.jpg"), UIImage(named: "Наруто.jpg"), UIImage(named: "тетрадь смерти.jpg"))]
    
    let menuArray = ["Философия", "Роман", "Антиутопия", "Манга"]
    
    let coverSwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        //Adding store logo
        self.storeLogoImage.frame = CGRect(x: 135, y: 110, width: 140, height: 80)
        self.view.addSubview(self.storeLogoImage)

        //UISegmentControl
        self.segmentControll = UISegmentedControl.init(items: self.menuArray)
        self.segmentControll.frame = CGRect(x: 6, y: 220, width: 400, height: 30)
        self.segmentControll.selectedSegmentTintColor = .cyan
        self.view.addSubview(self.segmentControll)
        
        self.segmentControll.addTarget(self, action: #selector(changeBook), for: .valueChanged)
        
        //Adding gesture
        imageView.isUserInteractionEnabled = true
        let firstGesture = UITapGestureRecognizer(target: self, action: #selector(showSecondView(sender:)))
        imageView.addGestureRecognizer(firstGesture)
        
        //Adding an image where first book will appear
        self.imageView.tag = 1
        self.imageView.frame = CGRect(x: 35, y: 280, width: 150, height: 210)
        self.imageView.image = self.imageArray[0].0
        self.view.addSubview(self.imageView)
        
        //Adding second gesture
        secondImageView.isUserInteractionEnabled = true
        let secondGesture = UITapGestureRecognizer(target: self, action: #selector(showSecondView(sender:)))
        secondImageView.addGestureRecognizer(secondGesture)
                
        //Adding an image where second book will appear
        self.secondImageView.tag = 2
        self.secondImageView.frame = CGRect(x: 35, y: 550, width: 150, height: 210)
        self.secondImageView.image = self.imageArray[0].1
        self.view.addSubview(self.secondImageView)
        
        //Adding third gesture
        thirdImageView.isUserInteractionEnabled = true
        let thirdGesture = UITapGestureRecognizer(target: self, action: #selector(showSecondView(sender:)))
        thirdImageView.addGestureRecognizer(thirdGesture)
        
        //Adding an image where third book will appear
        self.thirdImageView.tag = 3
        self.thirdImageView.frame = CGRect(x: 230, y: 280, width: 150, height: 210)
        self.thirdImageView.image = self.imageArray[0].2
        self.view.addSubview(self.thirdImageView)
        
        //Adding fourth gesture
        fourthImageView.isUserInteractionEnabled = true
        let fourthGesture = UITapGestureRecognizer(target: self, action: #selector(showSecondView(sender:)))
        fourthImageView.addGestureRecognizer(fourthGesture)
        
        //Adding an image where fourth book will appear
        self.fourthImageView.tag = 4
        self.fourthImageView.frame = CGRect(x: 230, y: 550, width: 150, height: 210)
        self.fourthImageView.image = self.imageArray[0].3
        self.view.addSubview(self.fourthImageView)
        
    }
    
    var segmentIndex = 0
    
    @objc func changeBook(target: UISegmentedControl) {
        segmentIndex = target.selectedSegmentIndex
            imageView.image = self.imageArray[segmentIndex].0
            secondImageView.image = self.imageArray[segmentIndex].1
            thirdImageView.image = self.imageArray[segmentIndex].2
            fourthImageView.image = self.imageArray[segmentIndex].3
    }
    
    @objc func showSecondView(sender: UITapGestureRecognizer) {
        guard let tag = sender.view?.tag else { return }
        var image = UIImage()
        switch tag {
        case 1:
            image = imageArray[segmentIndex].0 ?? UIImage()
        case 2:
            image = imageArray[segmentIndex].1 ?? UIImage()
        case 3:
            image = imageArray[segmentIndex].2 ?? UIImage()
        case 4:
            image = imageArray[segmentIndex].3 ?? UIImage()
        default:
            break
        }
              let secondViewController = SecondViewController()
        
        secondViewController.firstImage = image
        navigationController?.pushViewController(secondViewController, animated: true)
            
            }

}

