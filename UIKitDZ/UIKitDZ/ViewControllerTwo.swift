//
//  ViewControllerTwo.swift
//  UIKitDZ
//
//  Created by Valery on 24.06.2021.
//

import UIKit

class ViewControllerTwo: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - 5 Добавить кнопку «выставить счёт» расположить на втором экране и по нажатию выкидывать Алерт продолжить да или нет, если нет то убираем Алерт если да то переходим на третий экран
    
    func changeViewCntlr() {
        self.performSegue(withIdentifier: "ShowViewThree", sender: self)
    }
    
    @IBAction func checkButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Выставить чек?", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .default) { (action) in
        }
        let actionForCheck = UIAlertAction(title: "Чек", style: .default) { (actionCheck) in
            self.changeViewCntlr()
        }
        
        alert.addAction(action)
        alert.addAction(actionForCheck)
        self.present(alert, animated: true, completion: nil)
    }
    
}
