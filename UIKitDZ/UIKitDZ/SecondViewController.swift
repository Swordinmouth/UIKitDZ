//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Valery on 25.06.2021.
//

import UIKit

class SecondViewController: UIViewController {
    //MARK: 2 По нажатию на “Войти” переходим на второй экран Birthday (Это не таблица) куда будут добавляться дни рождения с третьего экрана. марта, в среду…” захардкожены.
    //MARK: - Jeremy
    let nameJeremy = UILabel()
    let bioJeremy = UILabel()
    let dayCountJeremy = UILabel()
    let viewJeremy = UIView()
    let imageJeremy = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
    
    //MARK: - Maria
    let nameMaria = UILabel()
    let bioMaria = UILabel()
    let dayCountMaria = UILabel()
    let viewMaria = UIView()
    let imageMaria = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
    
    //MARK: - Stark
    let nameStark = UILabel()
    let bioStark = UILabel()
    let dayCountStark = UILabel()
    let viewStark = UIView()
    let imageStark = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Birthday" //тайтл второго контроллера
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(toThirdScreenPlease))
        
        nameJeremy.frame = CGRect(x: 75, y: 120, width: 100, height: 80)
        nameJeremy.text = "Jeremy"
        nameJeremy.font = .systemFont(ofSize: 25)
        nameJeremy.backgroundColor = .white
        nameJeremy.textColor = .black
        self.view.addSubview(nameJeremy)
        
        bioJeremy.frame = CGRect(x: 75, y: 180, width: 300, height: 30)
        bioJeremy.text = "10  марта, в среду исполнится 25 лет"
        bioJeremy.font = .systemFont(ofSize: 15)
        bioJeremy.textColor = .black
        bioJeremy.backgroundColor = .white
        self.view.addSubview(bioJeremy)
        
        viewJeremy.frame = CGRect(x: 75, y: 210, width: 300, height: 1)
        viewJeremy.backgroundColor = .gray
        self.view.addSubview(viewJeremy)
        
        dayCountJeremy.frame = CGRect(x: 320, y: 135, width: 70, height: 50)
        dayCountJeremy.text = "18 дней"
        dayCountJeremy.textColor = .gray
        dayCountJeremy.backgroundColor = .white
        self.view.addSubview(dayCountJeremy)
        
        imageJeremy.frame = CGRect(x: 0, y: 140, width: 70, height: 70)
        self.view.addSubview(imageJeremy)
        
        nameMaria.frame = CGRect(x: 75, y: 230, width: 100, height: 80)
        nameMaria.text = "Maria Lui"
        nameMaria.font = .systemFont(ofSize: 25)
        nameMaria.backgroundColor = .white
        nameMaria.textColor = .black
        self.view.addSubview(nameMaria)
        
        bioMaria.frame = CGRect(x: 75, y: 290, width: 300, height: 30)
        bioMaria.text = "30  марта, в четверг исполнится 20 лет"
        bioMaria.font = .systemFont(ofSize: 15)
        bioMaria.textColor = .black
        bioMaria.backgroundColor = .white
        self.view.addSubview(bioMaria)
        
        viewMaria.frame = CGRect(x: 75, y: 320, width: 300, height: 1)
        viewMaria.backgroundColor = .gray
        self.view.addSubview(viewMaria)
        
        dayCountMaria.frame = CGRect(x: 320, y: 245, width: 70, height: 50)
        dayCountMaria.text = "28 дней"
        dayCountMaria.textColor = .gray
        dayCountMaria.backgroundColor = .white
        self.view.addSubview(dayCountMaria)
        
        imageMaria.frame = CGRect(x: 0, y: 250, width: 70, height: 70)
        self.view.addSubview(imageMaria)
        
        nameStark.frame = CGRect(x: 75, y: 350, width: 100, height: 80)
        nameStark.text = "Jony Stark"
        nameStark.font = .systemFont(ofSize: 25)
        nameStark.backgroundColor = .white
        nameStark.textColor = .black
        self.view.addSubview(nameStark)
        
        bioStark.frame = CGRect(x: 75, y: 410, width: 300, height: 30)
        bioStark.text = "20  апреля, в субботу исполнится 22 лет"
        bioStark.font = .systemFont(ofSize: 15)
        bioStark.textColor = .black
        bioStark.backgroundColor = .white
        self.view.addSubview(bioStark)
        
        viewStark.frame = CGRect(x: 75, y: 440, width: 300, height: 1)
        viewStark.backgroundColor = .gray
        self.view.addSubview(viewStark)
        
        dayCountStark.frame = CGRect(x: 320, y: 355, width: 70, height: 50)
        dayCountStark.text = "53 дней"
        dayCountStark.textColor = .gray
        dayCountStark.backgroundColor = .white
        self.view.addSubview(dayCountStark)
    
        imageStark.frame = CGRect(x: 0, y: 370, width: 70, height: 70)
        self.view.addSubview(imageStark)
    }
    
    
    @objc func toThirdScreenPlease() {
        let thirdVC = ThirdViewController()
        present(thirdVC, animated: true, completion: nil)
    }
    
}
