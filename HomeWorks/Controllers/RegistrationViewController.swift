//
//  RegistrationViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 20.04.2023.
//

import UIKit
import SnapKit

class RegistrationViewController: UIViewController {

    
    private lazy var registrationLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .registration)
        return label
    }()
    
    private lazy var userNameLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .userName)
        return label
    }()
    
    private lazy var userNameTextField: CustomTextField = {
        let txtField = CustomTextField()
        txtField.tag = 0
        txtField.configure(type: .name)
        txtField.delegate = self
        return txtField
    }()
    
    private lazy var userPasswordLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .userPassword)
        return label
    }()
    
    private lazy var userPasswordTextField: CustomTextField = {
        let txtField = CustomTextField()
        txtField.tag = 1
        txtField.configure(type: .password)
        txtField.delegate = self
        return txtField
    }()
    
    private lazy var userFavouriteFlowersLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .userFavouriteFlower)
        return label
    }()
    
    private lazy var userFavouriteFlowersTextField: CustomTextField = {
        let txtField = CustomTextField()
        txtField.tag = 2
        txtField.configure(type: .favouriteFlowers)
        txtField.delegate = self
        return txtField
    }()
    
    private lazy var userEmailLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .userEmail)
        return label
    }()
    
    private lazy var userEmailTextField: CustomTextField = {
        let txtField = CustomTextField()
        txtField.tag = 3
        txtField.configure(type: .email)
        txtField.delegate = self
        return txtField
    }()
    
    private lazy var userNumberLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .userNumber)
        return label
    }()
    
    private lazy var userNumberTextField: CustomTextField = {
        let txtField = CustomTextField()
        txtField.tag = 4
        txtField.configure(type: .number)
        txtField.addDoneButtonOnKeyboard()
        txtField.delegate = self
        return txtField
    }()
    
    private lazy var acceptUserAgreeLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .acceptUserAgreement)
        return label
    }()
    
    private lazy var acceptAgreeSwitch: UISwitch = {
        let acceptSwitch = UISwitch()
        acceptSwitch.onTintColor = UIColor.customStrongPink
        return acceptSwitch
    }()
    
    private lazy var readUserAgreeButton: CustomButton = {
        let button = CustomButton()
        button.configure(type: .readAgreement)
        button.addTarget(self, action: #selector(readAgreeButtonPressed), for: .touchUpInside)

        return button
    }()
    
    private lazy var enterButton: CustomButton = {
        let button = CustomButton()
        button.configure(type: .enter)
        button.addTarget(self, action: #selector(enterButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    
    //ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
        addObservers()
    }
    
    private func setupLayouts() {
        setupView()
        setupRegistrationLabel()
        setupUserNameLabel()
        setupUserNameTextField()
        setupUserPasswordLabel()
        setupUserPasswordTextField()
        setupUserFavouriteFlowersLabel()
        setupUserFavouriteFlowersTextField()
        setupUserEmailLabel()
        setupUserEmailTextField()
        setupUserNumberLabel()
        setupUserNumberTextField()
        setupAcceptUserAgreeLabel()
        setupAgreeSwitch()
        setupReadUserAgreeButton()
        setupEnterButton()
    }
    
    
    //Observers
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UITextField.textDidBeginEditingNotification, object: nil)
    }
    
    @objc private func keyboardWillShow (notification: NSNotification) {
        if let textField = notification.object as? UITextField {
            let intersection = view.bounds.height/1.8 - (view.bounds.height - textField.frame.origin.y)
            if intersection > 0 {
                view.frame.origin.y = -intersection
            }
        }
    }
    
    @objc private func keyboardWillHide (notification: NSNotification) {
        view.frame.origin.y = 0
        view.endEditing(true)
    }
    
    private func unsubscribeFromAllNotifications() {
        NotificationCenter.default.removeObserver(self)
     }

    
    //Methods when buttons pressed
    @objc private func readAgreeButtonPressed () {
        present(UserAgreementViewController(), animated: true)
    }
    
    @objc private func enterButtonPressed () {
        unsubscribeFromAllNotifications()
    }
    
    // Setup Views
    private func setupView () {
        view.backgroundColor = UIColor.customPink
        
        let arrayOfViews = [registrationLabel, userNameLabel, userNameTextField, userPasswordLabel, userPasswordTextField, userFavouriteFlowersLabel, userFavouriteFlowersTextField, userEmailLabel, userEmailTextField, userNumberLabel, userNumberTextField, acceptUserAgreeLabel, acceptAgreeSwitch, readUserAgreeButton, enterButton]
        
        addSubviews(arrayOfViews)
        translateAuthMaskOff(arrayOfViews)
    }
    
    private func setupRegistrationLabel () {
        registrationLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(50)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setupUserNameLabel () {
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(registrationLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(30)
        }
    }
    
    private func setupUserNameTextField () {
        userNameTextField.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(30)
            $0.width.equalTo(200)
        }
    }
    
    private func setupUserPasswordLabel () {
        userPasswordLabel.snp.makeConstraints {
            $0.top.equalTo(userNameTextField.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(30)
        }
    }
    
    private func setupUserPasswordTextField () {
        userPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(userPasswordLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(30)
            $0.width.equalTo(200)
        }
    }
    
    private func setupUserFavouriteFlowersLabel () {
        userFavouriteFlowersLabel.snp.makeConstraints {
            $0.top.equalTo(userPasswordTextField.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(30)
        }
    }
    
    private func setupUserFavouriteFlowersTextField () {
        userFavouriteFlowersTextField.snp.makeConstraints {
            $0.top.equalTo(userFavouriteFlowersLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(30)
            $0.width.equalTo(330)
        }
    }
    
    private func setupUserEmailLabel () {
        userEmailLabel.snp.makeConstraints {
            $0.top.equalTo(userFavouriteFlowersTextField.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(30)
        }
    }
    
    private func setupUserEmailTextField () {
        userEmailTextField.snp.makeConstraints {
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(30)
            $0.width.equalTo(330)
        }
    }
    
    private func setupUserNumberLabel () {
        userNumberLabel.snp.makeConstraints {
            $0.top.equalTo(userEmailTextField.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(30)
        }
    }
    
    private func setupUserNumberTextField () {
        userNumberTextField.snp.makeConstraints {
            $0.top.equalTo(userNumberLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(30)
            $0.width.equalTo(330)
        }
    }
    
    private func setupAcceptUserAgreeLabel () {
        acceptUserAgreeLabel.snp.makeConstraints {
            $0.top.equalTo(userNumberTextField.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(30)
        }
    }
    
    private func setupAgreeSwitch () {
        acceptAgreeSwitch.snp.makeConstraints {
            $0.top.equalTo(userNumberTextField.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(30)
        }
    }
    
    private func setupReadUserAgreeButton () {
        readUserAgreeButton.snp.makeConstraints {
            $0.top.equalTo(acceptUserAgreeLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(30)
            $0.height.equalTo(30)
            $0.width.equalTo(200)
        }
    }
    
    private func setupEnterButton () {
        enterButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(35)
            $0.width.equalTo(100)
        }
    }
}



extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0, 1, 2, 3:
            if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
                nextField.becomeFirstResponder() }
            return true
        case 4:
            textField.resignFirstResponder()
            return true
        default: return true
        }
    }
}

