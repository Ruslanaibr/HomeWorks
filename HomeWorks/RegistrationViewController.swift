//
//  RegistrationViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 20.04.2023.
//

import Foundation
import UIKit

class RegistrationViewController : UIViewController {
    
    private let separator = UIImageView()
    private let name = UILabel()
    private let nameTxtField = UITextField()
    private let guests = UILabel()
    private let numberOfGuestsTxtField = UITextField()
    private let tableNumber = UILabel()
    private let tableNumberTxtField = UITextField()
    private let billButton = UIButton()
    private let switchBooking = UISwitch()
    private let switchPrepay = UISwitch()
    private let switchVip = UISwitch()
    private let labelBooking = UILabel()
    private let labelPrepay = UILabel()
    private let labelVip = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Cafe Mario"
        setupLayouts()
    }
    
    func setupLayouts () {
        configureSeparator()
        
        configureLabels(label: name, with: "Name", indent: separator, points: -60)
        
        configureTF(field: nameTxtField, title: "Enter the name", indent: name, points: 30)
        
        configureLabels(label: guests, with: "Number of Guests", indent: nameTxtField, points: 20)
        
        configureTF(field: numberOfGuestsTxtField, title: "Enter number of guests", indent: guests, points: 30)
        
        configureLabels(label: tableNumber, with: "Table number", indent: numberOfGuestsTxtField, points: 20)
        
        configureTF(field: tableNumberTxtField, title: "Enter the table number", indent: tableNumber, points: 30)
        
        configureLabels(label: labelBooking, with: "Booked a table?", indent: tableNumberTxtField, points: 40)
        
        configureSwitches(switches: switchBooking, indent: tableNumberTxtField, points: 40)
        
        configureLabels(label: labelPrepay, with: "Was it prepaid?", indent: labelBooking, points: 50)
        
        configureSwitches(switches: switchPrepay, indent: switchBooking, points: 40)
        
        configureLabels(label: labelVip, with: "Vip room?", indent: labelPrepay, points: 50)
        
        configureSwitches(switches: switchVip, indent: switchPrepay, points: 40)
        
        configureBillButton()
    }
    
    @objc func performBillVC (param: UIButton) {
            let billVC = BillViewController()
            self.navigationController?.pushViewController(billVC, animated: true)
    }
    
    //MARK: Configure layouts
    
    
    func configureSeparator () {
        view.addSubview(separator)
        
        separator.image = UIImage(named: "separator")
        separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            separator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            separator.heightAnchor.constraint(equalToConstant: 150),
            separator.widthAnchor.constraint(equalToConstant: 380)
            
        ])
    }
    
    func configureLabels (label: UILabel, with title: String, indent: UIView, points: Int) {
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.textColor = UIColor(red: 134/255, green: 112/255, blue: 112/255, alpha: 1)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: indent.bottomAnchor, constant: CGFloat(points)),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.widthAnchor.constraint(equalToConstant: 150),
            label.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
    
    func configureTF (field: UITextField, title: String, indent: UIView, points: Int) {
        view.addSubview(field)
        
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = title
        field.borderStyle = .roundedRect
        field.keyboardAppearance = .dark
        
        
        NSLayoutConstraint.activate([
            field.topAnchor.constraint(equalTo: indent.topAnchor, constant: CGFloat(points)),
            field.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            field.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
            
        ])
    }
    
    func configureSwitches (switches: UISwitch, indent: UIView, points: Int) {
        view.addSubview(switches)
        
        switches.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            switches.topAnchor.constraint(equalTo: indent.bottomAnchor, constant: CGFloat(points)),
            switches.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    func configureBillButton () {
        view.addSubview(billButton)
        
        billButton.translatesAutoresizingMaskIntoConstraints = false
        billButton.setTitle("Bill", for: .normal)
        billButton .backgroundColor = UIColor(red: 213/255, green: 180/255, blue: 180/255, alpha: 1)
        billButton.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            billButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            billButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            billButton.heightAnchor.constraint(equalToConstant: 60),
            billButton.widthAnchor.constraint(equalToConstant: 400)
        ])
        
        billButton.addTarget(self, action: #selector(performBillVC(param:)), for: .touchUpInside)
        
    }
    
    
    
}
