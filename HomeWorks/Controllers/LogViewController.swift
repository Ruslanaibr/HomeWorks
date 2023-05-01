//
//  ViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 20.04.2023.
//

import UIKit

final class LogViewController: UIViewController {

    private let image         = UIImageView()
    private let labelLog      = UILabel()
    private let txtFieldLog   = UITextField()
    private let labelPassw    = UILabel()
    private let txtFieldPassw = UITextField()
    private let buttonEnter   = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    @objc private func enterPressed () {
        navigationController?.pushViewController(FoodCategoriesViewController(), animated: true)
    }
    
    private func setupLayouts () {
        configureView()
        configureImage()
        configureLabels(label: labelLog,  y: 80+image.bounds.height, text: "Tel. number")
        configureTxtFields(field: txtFieldLog, placeholder: "+1 408 809 445", y: 80+image.bounds.height + labelLog.bounds.height)
        configureLabels(label: labelPassw, y: 80+image.bounds.height + labelLog.bounds.height + txtFieldLog.bounds.height, text: "Password")
        configureTxtFields(field: txtFieldPassw, placeholder: "*********", y: 80+image.bounds.height + labelLog.bounds.height + txtFieldLog.bounds.height + labelPassw.bounds.height)
        configureButton()
    }
    
    private func configureView () {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configureImage () {
        view.addSubview(image)
        
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        image.frame = CGRect(x: 100, y: 80, width: 200, height: 200)
        
    }
    private func configureLabels (label: UILabel, y : CGFloat, text: String) {
        view.addSubview(label)
        
        label.frame = CGRect(x: 30, y: y, width: 400, height: 70)
        label.text = text
        label.font = UIFont(name: "GreatVibes-Regular", size: 40)
    }
    private func configureTxtFields (field : UITextField, placeholder : String, y : CGFloat) {
        view.addSubview(field)
        
        field.placeholder = placeholder
        field.frame = CGRect(x: 30, y: y, width: 300, height: 50)
        field.borderStyle = UITextField.BorderStyle.roundedRect
    }
    private func configureButton () {
        view.addSubview(buttonEnter)
        
        buttonEnter.frame = CGRect(x: 120, y: 700, width: 150, height: 50)
        buttonEnter.setTitle("Enter", for: .normal)
        buttonEnter.backgroundColor = .orange
        buttonEnter.layer.cornerRadius = 15
        buttonEnter.layer.shadowOpacity = 0.5
        
        buttonEnter.addTarget(self, action: #selector(enterPressed), for: .touchUpInside)
    }


}

