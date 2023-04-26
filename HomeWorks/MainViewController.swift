//
//  ViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 20.04.2023.
//

import UIKit

class MainViewController: UIViewController {

    private let labelWelcome = UILabel()
    private let labelAboutUs = UILabel()
    private let imageLogo    = UIImageView()
    private let goButton     = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    private func setupLayouts () {
        congigureView()
        congigureWelcomeLabel()
        congigureImageLogo()
        congigurelabelAboutUs()
        configureGoButton()
    }
    
    @objc private func goPressed() {
        navigationController?.pushViewController(ListViewController(), animated: true)
    }
    
    private func congigureView () {
        view.backgroundColor = K.Color.lightBlue
    }
    
    private func congigureWelcomeLabel () {
        view.addSubview(labelWelcome)
        labelWelcome.text = K.TextMain.welcome
        labelWelcome.font = UIFont(name: "Orbitron", size: 40)
        labelWelcome.translatesAutoresizingMaskIntoConstraints = false
        labelWelcome.layer.shadowOpacity = 0.4
        labelWelcome.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            labelWelcome.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelWelcome.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
    
    private func congigureImageLogo () {
        view.addSubview(imageLogo)
        imageLogo.image = UIImage(named: "logo")
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.layer.shadowOpacity = 0.4
        
        NSLayoutConstraint.activate([
            imageLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            imageLogo.topAnchor.constraint(equalTo: labelWelcome.bottomAnchor, constant: 1),
            imageLogo.heightAnchor.constraint(equalToConstant: 200),
            imageLogo.widthAnchor.constraint(equalToConstant: 230)
        ])
    }
    
    private func congigurelabelAboutUs () {
        view.addSubview(labelAboutUs)
        labelAboutUs.text = K.TextMain.aboutUs
        labelAboutUs.font = UIFont(name: "Orbitron", size: 17)
        labelAboutUs.translatesAutoresizingMaskIntoConstraints = false
        labelAboutUs.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            labelAboutUs.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelAboutUs.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 20),
            labelAboutUs.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            labelAboutUs.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            labelAboutUs.heightAnchor.constraint(equalToConstant: 200),
            labelAboutUs.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func configureGoButton () {
        view.addSubview(goButton)
        goButton.setTitle("Go to shopping", for: .normal)
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.backgroundColor = K.Color.gray
        goButton.layer.cornerRadius = 25
        goButton.layer.shadowOpacity = 0.7
        
        NSLayoutConstraint.activate([
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            goButton.heightAnchor.constraint(equalToConstant: 70),
            goButton.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        goButton.addTarget(self, action: #selector(goPressed), for: .touchUpInside)
    }
    
}

