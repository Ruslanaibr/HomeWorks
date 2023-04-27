//
//  ProductViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 26.04.2023.
//

import UIKit

class ProductViewController: UIViewController {
    
    var product : Product?
    private var segmentColor = UISegmentedControl()
    private let menuArray    = ["Black", "White"]
    private let labelPrice   = UILabel()
    private let separator    = UIImageView(image: UIImage(named: "separator"))
    private let slider       = UISlider()
    private let labelContr   = UILabel()
    private let currentFee   = UILabel()
    private let goButton     = UIButton()
    private let imageCar     = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    private func setupLayouts () {
        congigureView()
        configureImage()
        configureSeparator()
        configureSegmentColor()
        configureLabelPrice()
        configureLabelContr()
        configureSlider()
        configureLabelFee()
        configureGoButton()
    }
    
    
    //Смена картинки товара по нажатию на сегментКонтрол
    @objc private func segmentChanged (param: UISegmentedControl) {
        if let car = product {
            switch param.selectedSegmentIndex {
            case 0: imageCar.image = UIImage(named: "\(car.black)full")
            case 1 :imageCar.image =  UIImage(named: "\(car.white)full")
            default: break
            }
        }
    }
    
    //Отображение выбранного числа на слайдере
    @objc private func sliderChanged (param: UISlider) {
        currentFee.text = "Your initial fee is \(Int(param.value))?"
    }
    
    // Переход к четвертому контроллеру по нажатию на кнопку, передача выбранного на слайдере значения
    @objc private func applyPressed () {
        let alert = UIAlertController(title: "You need to fill out an application form", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: { action in
            let destinationVC = FormViewController()
            destinationVC.fee = self.slider.value
            self.present(destinationVC, animated: true)
        }))
        present(alert, animated: true)
    }
    
    //Настройка view
    private func congigureView () {
        view.backgroundColor = K.Color.lightGray
    }
    
    //Настройка главной картинки
    
    private func configureImage () {
        view.addSubview(imageCar)
        if let car = product {
            imageCar.image = UIImage(named: "\(car.black)full")
            imageCar.translatesAutoresizingMaskIntoConstraints = false
            imageCar.layer.borderWidth = 10
            imageCar.layer.shadowOpacity = 7
            NSLayoutConstraint.activate([
                imageCar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
                imageCar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                imageCar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                imageCar.heightAnchor.constraint(equalToConstant: 250)
            ])
        }
    }
    
    //Настройка разделителя
    private func configureSeparator () {
        view.addSubview(separator)
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: imageCar.bottomAnchor, constant: 0),
            separator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            separator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    // Настройка сегментКонтрола
    private func configureSegmentColor () {
        
        segmentColor = UISegmentedControl(items: menuArray)
        view.addSubview(segmentColor)
        segmentColor.translatesAutoresizingMaskIntoConstraints = false
        segmentColor.selectedSegmentIndex = 0
        
        NSLayoutConstraint.activate([
            segmentColor.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 30),
            segmentColor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentColor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        segmentColor.addTarget(self, action: #selector(segmentChanged(param:)), for: .valueChanged)
    }
    
    //Настройка лейбла с ценой товара
    private func configureLabelPrice () {
        view.addSubview(labelPrice)
        if let car = product {
            labelPrice.translatesAutoresizingMaskIntoConstraints = false
            labelPrice.text = "\(car.price)₽"
            labelPrice.textColor = K.Color.gray
            labelPrice.font = UIFont(name: "Orbitron", size: 30)
            labelPrice.layer.shadowOpacity = 0.2
            
            NSLayoutConstraint.activate([
                labelPrice.topAnchor.constraint(equalTo: segmentColor.bottomAnchor, constant: 30),
                labelPrice.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            ])
        }
    }
    
    //Настройка лейбла
    private func configureLabelContr() {
        view.addSubview(labelContr)
        
        labelContr.text = "Add your initial fee"
        labelContr.translatesAutoresizingMaskIntoConstraints = false
        labelContr.font = UIFont(name: "Orbitron", size: 20)
        labelContr.textColor = K.Color.gray
        
        NSLayoutConstraint.activate([
            labelContr.topAnchor.constraint(equalTo: labelPrice.bottomAnchor, constant: 30),
            labelContr.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    //Настройка слайдера
    private func  configureSlider () {
        view.addSubview(slider)
        
        if let car = product {
            
            slider.translatesAutoresizingMaskIntoConstraints = false
            slider.minimumValue = 0
            if let price = Float(car.price) {
                slider.maximumValue = price
                print(price)
            }
            slider.setThumbImage(UIImage(systemName: "arrowshape.forward"), for: .normal)
            slider.tintColor = K.Color.gray
            
            NSLayoutConstraint.activate([
                slider.topAnchor.constraint(equalTo: labelContr.bottomAnchor, constant: 50),
                slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
            slider.addTarget(self, action: #selector(sliderChanged(param:)), for: .valueChanged)
        }
    }
    
    
    // Настройка лейбла, который отражает выбранное значение слайдера
    private func configureLabelFee () {
        view.addSubview(currentFee)
        
        currentFee.translatesAutoresizingMaskIntoConstraints = false
        currentFee.text = "Your initial fee is 0?"
        currentFee.font = UIFont(name: "Orbitron", size: 23)
        currentFee.numberOfLines = 0
        
        NSLayoutConstraint.activate([
           currentFee.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 50),
           currentFee.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           currentFee.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    //Настройка кнопки 
    private func configureGoButton () {
        view.addSubview(goButton)
        
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.setTitle("Apply", for: .normal)
        goButton.backgroundColor = K.Color.gray
        goButton.layer.cornerRadius = 20
        goButton.layer.shadowOpacity = 0.7
        
        NSLayoutConstraint.activate([
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            goButton.heightAnchor.constraint(equalToConstant: 60),
            goButton.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        goButton.addTarget(self, action: #selector(applyPressed), for: .touchUpInside)
    }
    
}
