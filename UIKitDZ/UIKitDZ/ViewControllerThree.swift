//
//  ViewControllerThree.swift
//  UIKitDZ
//
//  Created by Valery on 25.06.2021.
//

import UIKit

class ViewControllerThree: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    //MARK: - 6.На свое усмотрение добавить свою фичу в приложение которое его улучшит
    // Не фича, конечно, но и не баг) Фантазии и умений особо не хватает пока на что-то другое

    @IBAction func goToRoot(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
