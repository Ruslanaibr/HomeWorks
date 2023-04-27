//
//  ListViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 26.04.2023.
//

import UIKit

class ListViewController: UIViewController {
    
    private let imageProduct1 = UIImageView()
    private let labelProduct1 = UILabel()
    private let imageProduct2 = UIImageView()
    private let labelProduct2 = UILabel()
    private let imageProduct3 = UIImageView()
    private let labelProduct3 = UILabel()
    private let imageProduct4 = UIImageView()
    private let labelProduct4 = UILabel()
    private let imageProduct5 = UIImageView()
    private let labelProduct5 = UILabel()
    private let imageProduct6 = UIImageView()
    private let labelProduct6 = UILabel()
    private let labelDream    = UILabel()
    
    private let product1 = Product(white: "audi6White", black: "audi6Black", price: "2359999")
    private let product2 = Product(white: "mercWhite", black: "mercBlack", price: "12980000")
    private let product3 = Product(white: "bmw6White", black: "bmw6Black", price: "7655000")
    private let product4 = Product(white: "bentlWhite", black: "bentlBlack", price: "25199000")
    private let product5 = Product(white: "mazdaWhite", black: "mazdaBlack", price: "2000000")
    private let product6 = Product(white: "royceWhite", black: "royceBlack", price: "23980100")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    private func setupLayouts () {
        configureView()
        configureMainStack()
        configureLabelDream()
    }
    
    //Возвращение на прошлый экран по нажатию левой кнокпи на баре
    @objc private func backPressed () {
        navigationController?.popViewController(animated: true)
    }
    
    // Передача характеристик товара третьему контроллеру по нажатию на картинку товара
    @objc func imgPressed (sender: UITapGestureRecognizer) {
        let destinationVC = ProductViewController()
        if let tag = sender.view?.tag {
            switch tag {
            case 1: destinationVC.product = product1
            case 2: destinationVC.product = product2
            case 3: destinationVC.product = product3
            case 4: destinationVC.product = product4
            case 5: destinationVC.product = product5
            case 6: destinationVC.product = product6
            default : break
            }
        }
        present(destinationVC, animated: true)
    }
    
    //Настройка view
    private func configureView () {
        view.backgroundColor = K.Color.lightBlue
        //Change leftBarButton
        let leftItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.backward"), style: .plain, target: self, action: #selector(backPressed))
        navigationItem.leftBarButtonItem = leftItem
        
        title = "Cars in stock"
        
        
        //Изменение цвета Navigation Bar
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = K.Color.gray
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    
    //Настройка главного вертикального стека
    private func configureMainStack () {
        let hStack1 = configureHstack1()
        let hStack2 = configureHstack2()

        let separator1     = UIImageView(image: UIImage(named: "separator"))
        let separator2     = UIImageView(image: UIImage(named: "separator"))
        let separator3     = UIImageView(image: UIImage(named: "separator"))
        
        let array = [separator3, hStack1,separator1, hStack2, separator2]
        let vStack = UIStackView(arrangedSubviews: array)
        
        view.addSubview(vStack)
        vStack.axis = .vertical
        vStack.spacing = 20
        vStack.distribution = .equalSpacing
        addConstraintsTo(stack: vStack)
    }
    
    //Constraints для вертиклаьного стека
    private func addConstraintsTo (stack: UIStackView) {
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -350)
        ])
    }
    
    // Настройка горизонтального стека - первого ряда
    private func configureHstack1 () -> UIStackView {
        
        let vStack1 = configureVStackCell(image: imageProduct1, label: labelProduct1, imgName: product1.black, txtLabel: "Audi A6", tag: 1)
        let vStack2 = configureVStackCell(image: imageProduct2, label: labelProduct2, imgName: product2.black, txtLabel: "Mercedes GLE", tag: 2)
        let vStack3 = configureVStackCell(image: imageProduct3, label: labelProduct3, imgName: product3.black, txtLabel: "BMW X6", tag: 3)
        
        let sep1 = UIImageView(image: UIImage(named: "separatorVert"))
        let sep2 = UIImageView(image: UIImage(named: "separatorVert"))
        
        
        let array = [vStack1,sep1,vStack2,sep2,vStack3]
        let hStack = UIStackView(arrangedSubviews: array)
        hStack.axis = .horizontal
        hStack.spacing = 10
        hStack.distribution = .equalSpacing
        return hStack
    }
    // Настройка горизонтального стека - второго ряда
    private func configureHstack2 () -> UIStackView {
        let vStack1 = configureVStackCell(image: imageProduct4, label: labelProduct4, imgName: product4.black, txtLabel: "Bentley", tag: 4)
        let vStack2 = configureVStackCell(image: imageProduct5, label: labelProduct5, imgName: product5.black, txtLabel: "Mazda", tag: 5)
        let vStack3 = configureVStackCell(image: imageProduct6, label: labelProduct6, imgName: product6.white, txtLabel: "Rolls-Royce", tag: 6)
        
        
        let sep1 = UIImageView(image: UIImage(named: "separatorVert"))
        let sep2 = UIImageView(image: UIImage(named: "separatorVert"))
        
        let array = [vStack1,sep1,vStack2,sep2,vStack3]
        let hStack = UIStackView(arrangedSubviews: array)
        hStack.axis = .horizontal
        hStack.spacing = 10
        hStack.distribution = .equalSpacing
        return hStack
    }
    
    // Настройка вертикальных стеков, состоящих из картинки и лейбла
    private func configureVStackCell (image: UIImageView, label: UILabel, imgName: String, txtLabel : String, tag : Int)  -> UIStackView{
        
        let array = [image,label]
        
        image.image = UIImage(named: imgName)
        image.layer.borderWidth = 3
        image.layer.cornerRadius = 5
        image.layer.shadowOpacity = 7
        image.tag = tag
        
        
        image.isUserInteractionEnabled = true
        let imgPressed = UITapGestureRecognizer(target: self, action: #selector(imgPressed(sender:)))
        image.addGestureRecognizer(imgPressed)
        
        label.text = txtLabel
        label.layer.shadowOpacity = 0.31
        
        let vStack = UIStackView(arrangedSubviews: array)
        vStack.axis = .vertical
        vStack.spacing = 10
        vStack.distribution = .equalSpacing
        return vStack
    }
    
    //Настройка лейбла
    private func configureLabelDream () {
        view.addSubview(labelDream)
        
        labelDream.text = K.TextList.dream
        labelDream.font = UIFont(name: "Orbitron", size: 23)
        labelDream.translatesAutoresizingMaskIntoConstraints = false
        labelDream.backgroundColor = K.Color.gray
        labelDream.textColor = .white
        labelDream.layer.shadowOpacity = 1
        
        NSLayoutConstraint.activate([
            labelDream.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            labelDream.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelDream.widthAnchor.constraint(equalToConstant: view.bounds.size.width)
        ])
        
    }
    
    
}

