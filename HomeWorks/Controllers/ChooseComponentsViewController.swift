//
//  ChooseComponentsViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 30.04.2023.
//

import UIKit

final class ChooseComponentsViewController: UIViewController {

    var components : [String]?
    var image : UIImage?
    var name : String?
    private var totalSum  : Int = 700
    private let priceFor  = [1 : 100, 2 : 80, 3: 150, 4: 200]
    private var chosenComp = [Int: String?]()
    private let mainImage = UIImageView()
    private let labelTitle = UILabel()
    private let labelComp1 = UILabel()
    private let labelComp2 = UILabel()
    private let labelComp3 = UILabel()
    private let labelComp4 = UILabel()
    private let switchComp1 = UISwitch()
    private let switchComp2 = UISwitch()
    private let switchComp3 = UISwitch()
    private let switchComp4 = UISwitch()
    private let payButton   = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    private func setupLayouts () {
        
        configureView()
        configureImg()
        
        
        if let text = name {
            configureLabels(label: labelTitle, text: text, bottom: view.safeAreaLayoutGuide.topAnchor, left: 130, size: 40)
        }
        
        
        if let ingredients = components {
            configureLabels(label: labelComp1, text: ingredients[0], bottom: mainImage.bottomAnchor, left: 30, size: 20)
            configureLabels(label: labelComp2, text: ingredients[1], bottom: labelComp1.bottomAnchor, left: 30, size: 20)
            configureLabels(label: labelComp3, text: ingredients[2], bottom: labelComp2.bottomAnchor, left: 30, size: 20)
            configureLabels(label: labelComp4, text: ingredients[3], bottom: labelComp3.bottomAnchor, left: 30, size: 20)
        }
        
        
        configureSwitches(switchComp: switchComp1, bottom: mainImage.bottomAnchor, top: 40, right: -30, selector: #selector(switchChanged(param:)), tag: 1)
        configureSwitches(switchComp: switchComp2, bottom: switchComp1.bottomAnchor, top: 15, right: -30, selector: #selector(switchChanged(param:)), tag: 2)
        configureSwitches(switchComp: switchComp3, bottom: switchComp2.bottomAnchor, top: 15, right: -30, selector: #selector(switchChanged(param:)), tag: 3)
        configureSwitches(switchComp: switchComp4, bottom: switchComp3.bottomAnchor, top: 15, right: -30, selector: #selector(switchChanged(param:)), tag: 4)
        configureButton()
    }
    
    @objc private func payPressed () {
        
        let destinationVC = PaymentViewController()
        
        destinationVC.total = totalSum
        
        destinationVC.nameOfChosenPizza = name!
        for (_, comp) in chosenComp {
            if comp != nil {
                destinationVC.components.append(comp!)
            }
        }
        present(destinationVC, animated: true)
    }
    
    @objc private func switchChanged (param : UISwitch){
        
        if let comp = components {
            if param.isOn {
                switch param.tag {
                case 1 : totalSum += priceFor[1] ?? 0; chosenComp[0] = comp[0]
                case 2 : totalSum += priceFor[2] ?? 0; chosenComp[1] = comp[1]
                case 3 : totalSum += priceFor[3] ?? 0; chosenComp[2] = comp[2]
                case 4 : totalSum += priceFor[4] ?? 0; chosenComp[3] = comp[3]
                default: break
                }
            } else {
                switch param.tag {
                case 1 : totalSum -= priceFor[1] ?? 0; chosenComp[0] = nil
                case 2 : totalSum -= priceFor[2] ?? 0; chosenComp[1] = nil
                case 3 : totalSum -= priceFor[3] ?? 0; chosenComp[2] = nil
                case 4 : totalSum -= priceFor[4] ?? 0; chosenComp[3] = nil
                default: break
                }
            }
        }
    }
    
    private func configureView () {
        view.backgroundColor = .white
    }
    
    private func configureImg () {
        view.addSubview(mainImage)
        if let img = image {
            mainImage.image = img
        }
        mainImage.frame = CGRect(x: view.bounds.size.width/2 - 100 , y: 100, width: 200, height: 200)
    }
    
    private func configureLabels (label : UILabel, text: String, bottom: NSLayoutYAxisAnchor, left: CGFloat, size: CGFloat) {
        view.addSubview(label)
        
        label.text = text
        label.textColor = .black
        label.font = UIFont(name: "InstrumentSerif-Italic", size: size)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: bottom, constant: 15),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: left),
            label.heightAnchor.constraint(equalToConstant: 70),
            label.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureSwitches (switchComp : UISwitch, bottom: NSLayoutYAxisAnchor, top: CGFloat, right: CGFloat, selector : Selector, tag : Int ) {
        view.addSubview(switchComp)
        switchComp.tag = tag
        
        
        switchComp.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            switchComp.topAnchor.constraint(equalTo: bottom, constant: top),
            switchComp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: right),
            switchComp.heightAnchor.constraint(equalToConstant: 70),
            switchComp.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        switchComp.addTarget(self, action: selector, for: .valueChanged)
    }
    
    private func configureButton () {
        view.addSubview(payButton)
        
        payButton.backgroundColor = .orange
        payButton.setTitle("PAY", for: .normal)
        payButton.setTitleColor(.white, for: .normal)
        payButton.layer.cornerRadius = 20
        payButton.layer.shadowOpacity = 0.5
        payButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            payButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            payButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            payButton.heightAnchor.constraint(equalToConstant: 50),
            payButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        payButton.addTarget(self, action: #selector(payPressed), for: .touchUpInside)
    }
    

}

