//
//  ViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 20.04.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    private let logoImage = UIImageView()
    private let logoLabel = UILabel()
    private let signInLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let enterButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayouts()
    }
    
    func setupLayouts () {
        configureLogoImage()
        configureLogoLabel()
        configureSignIn()
        configureEmailTextField()
        configurePasswordextField()
        configureEnterButton()
    }
    
    @objc func performRegistrationVC () {
        let registrationVC = RegistrationViewController()
        self.navigationController?.pushViewController(registrationVC, animated: true)
    }
    
    //MARK: Configuring Layouts
    // IMAGE
    
    func configureLogoImage () {
        view.addSubview(logoImage)
        
        logoImage.image = UIImage(named: "resto")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
            logoImage.widthAnchor.constraint(equalToConstant: 130),
            logoImage.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    // CAFE
    func configureLogoLabel () {
        view.addSubview(logoLabel)
        
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        logoLabel.text = "CAFE"
        logoLabel.textColor = UIColor(red: 134/255, green: 112/255, blue: 112/255, alpha: 1)
        
        
        NSLayoutConstraint.activate([
            logoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: -40),
            logoLabel.widthAnchor.constraint(equalToConstant: 50),
            logoLabel.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    // SIGN IN
    func configureSignIn () {
        view.addSubview(signInLabel)
        
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        signInLabel.text = "Sign in"
        signInLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        signInLabel.textColor = UIColor(red: 134/255, green: 112/255, blue: 112/255, alpha: 1)
        
        
        NSLayoutConstraint.activate([
            signInLabel.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 30),
            signInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        ])
    }
    // TEXTFIELD EMAIL
    func configureEmailTextField () {
        view.addSubview(emailTextField)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.delegate = self
        emailTextField.placeholder = "Enter email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.keyboardAppearance = .dark
        
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
            
        ])
    }
    //PASSWORD TEXTFIELD
    
    func configurePasswordextField () {
        view.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.delegate = self
        passwordTextField.placeholder = "Enter password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardAppearance = .dark
        
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
            
        ])
    }
    
    func configureEnterButton () {
        view.addSubview(enterButton)
        
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.setTitle("Enter", for: .normal)
        enterButton.backgroundColor = UIColor(red: 228/255, green: 208/255, blue: 208/255, alpha: 1)
        enterButton.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            enterButton.heightAnchor.constraint(equalToConstant: 60),
            enterButton.widthAnchor.constraint(equalToConstant: 400)
        ])
        
        enterButton.addTarget(self, action: #selector(performRegistrationVC), for: .touchUpInside)
    }
    
}


extension LoginViewController : UITextFieldDelegate {
    
}

