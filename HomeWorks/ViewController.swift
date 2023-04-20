//
//  ViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 20.04.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private let sumButton = UIButton()
    private let playButton = UIButton()
    private let labelGreetings = UILabel()
    private var isGuessed = true
    private var hiddenNumber : Int?
    
    private let visualEffectView : UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        return effectView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 179/255, green: 201/255, blue: 156/255, alpha: 1.0)
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        greetings()
    }
    
    func setupLayout () {
        configureSumButton()
        configureLabelGreetings()
        configurePlayButton()
    }
    
    //MARK: Summation methods
    
    @objc func sumButtonPressed () {
        summationAlert()
    }
    
    func summationAlert () {
        
        visualEffectView.isHidden = false
        
        let alert = UIAlertController(title: "Please enter two numbers",
                                      message: nil,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "SUM",
                                      style: .default,
                                      handler: { action in
            self.visualEffectView.isHidden = true
            self.summationResult(of: alert.textFields?[0].text, and: alert.textFields?[1].text)
            
        }))
        
        
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "First number"
        })
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Second number"
        })
        
        self.present(alert, animated: true)
        
        
    }
    
    
    
    func summationResult (of num1: String?, and num2: String?) {
        
        let resultTitle : String
        
        if let s1 = num1 , let s2 = num2, let n1 = Int(s1) , let n2 = Int(s2) {
            resultTitle = "Result is : \(n1+n2)"
        } else {
            resultTitle = "Invalid values, try again"
        }
        
        resultAlert(title: resultTitle)
        
    }
    
    func resultAlert (title: String) {
        
        let resultAlert = UIAlertController(title: title,
                                            message: nil,
                                            preferredStyle: .actionSheet)
        resultAlert.addAction(UIAlertAction(title: "Ok",
                                            style: .default))
        self.present(resultAlert, animated: true)
    }
    
    
    //MARK: Game methods
    
    @objc func playButtonPressed () {
        gameAlert()
    }
    
    func gameAlert () {
        
        if isGuessed {
            hiddenNumber = Int.random(in: 0...10)
            print(hiddenNumber!)
            isGuessed = false
        }
        
        let alert = UIAlertController(title: "Guess number from 0 to 10",
                                      message: nil,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Guess",
                                      style: .default,
                                      handler: { action in
            
            if let text = alert.textFields?[0].text {
                
                if let chosenNumber = Int(text) {
                    if chosenNumber == self.hiddenNumber! {
                        self.resultAlert(title: "Well done! Guessed it!")
                        self.isGuessed = true
                    } else {
                        self.resultAlert(title: "No, try again(")
                    }
                } else {
                    self.resultAlert(title: "Please enter the number")
                }
            }
            }))
    
        alert.addTextField()
        self.present(alert, animated: true)
    }
    
    //MARK: Greetings
    
    func greetings() {
        
        configureVisualEffectView()
        
        let alert = UIAlertController(title: "Please enter your full name",
                                               message: "",
                                               preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ок",
                                               style: .default,
                                               handler: { action in
            
            if let name = alert.textFields?.first?.text {
                self.labelGreetings.text = "Hello, \(name)!"
            }
            
            self.visualEffectView.isHidden = true
        }))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Your full name..."
        })
        
        self.present(alert, animated: true)
    }
    
    
    
    //MARK: Configuring views
    
    func configureVisualEffectView () {
        view.addSubview(visualEffectView)
        
        NSLayoutConstraint.activate([
            visualEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            visualEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            visualEffectView.topAnchor.constraint(equalTo: view.topAnchor),
            visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureSumButton () {
        
        view.addSubview(sumButton)
        
        sumButton.backgroundColor = .white
        sumButton.translatesAutoresizingMaskIntoConstraints = false
        sumButton.setTitle("Summation", for: .normal)
        sumButton.setTitleColor(UIColor(red: 164/255, green: 188/255, blue: 146/255, alpha: 1), for: .normal)
        sumButton.layer.cornerRadius = 25
        
        
        NSLayoutConstraint.activate([
            sumButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sumButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            sumButton.heightAnchor.constraint(equalToConstant: 70),
            sumButton.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        
        sumButton.addTarget(self, action: #selector(sumButtonPressed), for: .touchUpInside)
    }
    
    func configurePlayButton () {
        view.addSubview(playButton)
        
        playButton.backgroundColor = .white
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setTitle("Play game", for: .normal)
        playButton.setTitleColor(UIColor(red: 164/255, green: 188/255, blue: 146/255, alpha: 1), for: .normal)
        playButton.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            playButton.heightAnchor.constraint(equalToConstant: 70),
            playButton.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
    }
    
    func configureLabelGreetings () {
        
        view.addSubview(labelGreetings)
        
        labelGreetings.text = "Hello"
        labelGreetings.textColor = .white
        labelGreetings.translatesAutoresizingMaskIntoConstraints = false
        labelGreetings.numberOfLines = 0
        labelGreetings.baselineAdjustment = .alignCenters
               
        
        NSLayoutConstraint.activate([
            labelGreetings.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelGreetings.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelGreetings.heightAnchor.constraint(equalToConstant: 70),
            labelGreetings.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}

