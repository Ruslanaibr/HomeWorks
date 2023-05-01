//
//  PizzaListViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 27.04.2023.
//

import UIKit

final class PizzaListViewController : UIViewController {
    
    private let imagePepe = UIImageView()
    private let imageMarg = UIImageView()
    private let labelPepe = UILabel()
    private let labelMarg = UILabel()
    private let componentForPepe = ["Double Peperoni", "Add Onion", "Double cheese", "Cheese crust"]
    private let componentForMarg = ["Tomatoes", "Remove onion", "Cheese", "Cheese crust"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    
    private func setupLayouts () {
        configureView()
        configureImgPeperoni()
        configureLabelPeperoni()
        configureImgMargarita()
        configureLabelmargarita()
    }
    
    private func configureView () {
        view.backgroundColor = .white
        title = "Pizza"
    }
    
    @objc private func chosePizza (sender: UITapGestureRecognizer) {
        let destinationVC = ChooseComponentsViewController()
        if let tag = sender.view?.tag {
            switch tag {
            case 1  : destinationVC.components = componentForPepe; destinationVC.image = UIImage(named: "pepe"); destinationVC.name = "Pepperoni"
            case 2  : destinationVC.components = componentForMarg; destinationVC.image = UIImage(named: "margarita"); destinationVC.name = "Margarita"
            default : break
            }
        }
        present(destinationVC, animated: true)
    }
    
    private func configureImgPeperoni () {
        view.addSubview(imagePepe)
        
        imagePepe.image = UIImage(named: "pepe")
        imagePepe.frame = CGRect(x: 30, y: 120, width: 130, height: 130)
        imagePepe.layer.shadowOpacity = 0.5
        imagePepe.tag = 1
        
        imagePepe.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(chosePizza(sender:)))
        imagePepe.addGestureRecognizer(tap)
    }
    private func configureLabelPeperoni () {
        view.addSubview(labelPepe)
        
        labelPepe.text = "Pepperoni"
        labelPepe.frame = CGRect(x: 200, y: 120, width: 200, height: 130)
        labelPepe.font = UIFont(name: "InstrumentSerif-Italic", size: 40)
        labelPepe.tag = 1
        
        labelPepe.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(chosePizza(sender:)))
        labelPepe.addGestureRecognizer(tap)
    }
    
    private func configureImgMargarita () {
        view.addSubview(imageMarg)
       
       imageMarg.image = UIImage(named: "margarita")
       imageMarg.frame = CGRect(x: 30, y: 300, width: 130, height: 130)
       imageMarg.layer.shadowOpacity = 0.5
       imageMarg.tag = 2
        
       imageMarg.isUserInteractionEnabled = true
       let tap = UITapGestureRecognizer(target: self, action: #selector(chosePizza(sender:)))
       imageMarg.addGestureRecognizer(tap)
    }
    
    private func configureLabelmargarita () {
        view.addSubview(labelMarg)
        
       labelMarg.text = "Margarita"
       labelMarg.frame = CGRect(x: 200, y: 300, width: 200, height: 130)
       labelMarg.font = UIFont(name: "InstrumentSerif-Italic", size: 40)
        labelMarg.tag = 2
        
        labelMarg.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(chosePizza(sender:)))
        labelMarg.addGestureRecognizer(tap)
    }
    
    
}
