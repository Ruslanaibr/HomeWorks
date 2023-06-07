//
//  UserAgreementViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 06.05.2023.
//

import UIKit

class UserAgreementViewController: UIViewController {

    private lazy var userAgreementLabel : CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .userAgreement)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    private func setupLayouts() {
        setupView()
        setupUserAgreementLabel()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.customLightPink
        
        addSubviews(userAgreementLabel)
        translateAuthMaskOff(userAgreementLabel)
    }
    
    private func setupUserAgreementLabel () {
        userAgreementLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(30)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
        }
    }

}
