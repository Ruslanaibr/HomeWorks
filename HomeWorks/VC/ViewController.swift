//
//  ViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 20.04.2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    private let startButton = UIButton()
    private var helloLabel = UILabel()
    private let image = UIImageView()
    private let helloModel = HelloModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 169/255, green: 144/255, blue: 126/255, alpha: 1)
        setupLayout()
    }
    
    func setupLayout () {
        configureButton()
        configureLabel()
        configureImage()
    }
    
    
    
    @objc func startButtonPressed () {
        alertHello()
    }
    
    
    
    func alertHello () {
        let alert = UIAlertController(title: "Enter \"leohl\"",
                                      message: nil,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { action in
            
            if let text = alert.textFields?[0].text {
                self.helloLabel.text = self.helloModel.getResult(userText: text)
                }
        }))
        
        alert.addTextField()
        self.present(alert, animated: true)
    }
    
    
    //MARK: Congiguring layouts
    
    func configureLabel () {
        view.addSubview(helloLabel)
        
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.textColor = UIColor(red: 103/255, green: 93/255, blue: 80/255, alpha: 1)
        helloLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        
        NSLayoutConstraint.activate([
            helloLabel.widthAnchor.constraint(equalToConstant: 150),
            helloLabel.heightAnchor.constraint(equalToConstant: 100),
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
    }
    
    
    func configureButton () {
        view.addSubview(startButton)
        
        startButton.setTitle("START", for: .normal)
        startButton.setTitleColor(UIColor(red: 103/255, green: 93/255, blue: 80/255, alpha: 1), for: .normal)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.backgroundColor = UIColor(red: 243/255 , green: 222/255, blue: 186/255, alpha: 1)
        startButton.layer.cornerRadius = 25
        startButton.layer.shadowOpacity = 1.0
        
        NSLayoutConstraint.activate([
            startButton.widthAnchor.constraint(equalToConstant: 250),
            startButton.heightAnchor.constraint(equalToConstant: 100),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
    }
    
    func configureImage () {
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "monkey")
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 150),
            image.heightAnchor.constraint(equalToConstant: 200),
            image.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 25),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }


}

