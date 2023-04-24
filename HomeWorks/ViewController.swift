//
//  ViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 20.04.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private let imageLogo = UIImageView()
    
    private let labelSignIn = UILabel()
    private let labelEmail = UILabel()
    private let textFieldEmail = UITextField()
    
    private let labelPassword = UILabel()
    private let textFieldPassword = UITextField()
    
    private let labelFaceId = UILabel()
    private let switchFaceId = UISwitch()
    
    private let buttonEnter = UIButton()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Const.Colors.milky
        title = "Birthday Reminder"
        setupLayouts()
    }
    
    func setupLayouts () {
        configureImage()
        configureLabels(label: labelSignIn, title: "Sign in", textColor: Const.Colors.purple , size: 25, under: imageLogo, leading: 30)
        configureLabels(label: labelEmail, title: "Email", textColor: Const.Colors.brown , size: 17, under: labelSignIn, leading: 30)
        configureTxtFields(field: textFieldEmail, placeholder: "Enter the email...", under: labelEmail)
        configureLabels(label: labelPassword, title: "Password", textColor: Const.Colors.purple, size: 17, under: textFieldEmail, leading: 30)
        configureTxtFields(field: textFieldPassword, placeholder: "Enter the password...", under: labelPassword)
        configureLabels(label: labelFaceId, title: "Face ID", textColor: Const.Colors.purple, size: 17, under: textFieldPassword, leading: 250)
        configureSwitch()
        configureButton()
        
    }
    
    @objc func enterButtonPressed () {
        navigationController?.pushViewController(BirthdayViewController(), animated: true)
    }
    
    func configureLabels (label : UILabel, title : String, textColor : UIColor, size : Int, under layout: UIView, leading: Int) {
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 70, height: 150))
        label.text = title
        label.textColor = textColor
        label.font = .boldSystemFont(ofSize: CGFloat(size))
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: layout.bottomAnchor , constant: 30),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(leading))
        ])
    }
    
    func configureTxtFields (field: UITextField, placeholder: String, under layout: UIView) {
        view.addSubview(field)
        
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = placeholder
        field.borderStyle = .roundedRect
        
        NSLayoutConstraint.activate([
           field.topAnchor.constraint(equalTo: layout.bottomAnchor , constant: 10),
           field.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           field.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func configureSwitch () {
        view.addSubview(switchFaceId)
        
        switchFaceId.translatesAutoresizingMaskIntoConstraints = false
        switchFaceId.onTintColor = Const.Colors.brown
        
        NSLayoutConstraint.activate([
        switchFaceId.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor , constant: 24),
           switchFaceId.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func configureImage () {
        view.addSubview(imageLogo)
        
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.image = UIImage(systemName: "birthday.cake")?.withTintColor(Const.Colors.purple, renderingMode: .alwaysOriginal)
        
        NSLayoutConstraint.activate([
            imageLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 50),
            imageLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageLogo.heightAnchor.constraint(equalToConstant: 100),
            imageLogo.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configureButton () {
        view.addSubview(buttonEnter)
        
        buttonEnter.translatesAutoresizingMaskIntoConstraints = false
        buttonEnter.setTitle("Enter", for: .normal)
        buttonEnter.backgroundColor = Const.Colors.purple
        buttonEnter.layer.cornerRadius = 25
        buttonEnter.layer.shadowOffset = CGSizeMake(2, 3)
        buttonEnter.layer.shadowOpacity = 0.7
        buttonEnter.layer.shadowRadius = 4
        
        NSLayoutConstraint.activate([
            buttonEnter.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttonEnter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            buttonEnter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonEnter.heightAnchor.constraint(equalToConstant: 50),
            buttonEnter.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        buttonEnter.addTarget(self, action: #selector(enterButtonPressed), for: .touchUpInside)
    }

}

