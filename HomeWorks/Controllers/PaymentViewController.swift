//
//  PaymentViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 30.04.2023.
//

import UIKit

final class PaymentViewController: UIViewController {

    var total: Int?
    var nameOfChosenPizza: String?
    var components = [String]()
    var orderListLabel = UILabel()
    let payButton = UIButton()
    let payByCardLabel = UILabel()
    let payByCashlabel = UILabel()
    let payByCardSwitch = UISwitch()
    let payByCashSwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
   
    
    private func setupLayouts () {
        configureView()
        addOrderItems()
        configureOrderListLabel()
        configureLabels(label: payByCardLabel, text: "Pay by card 💳", bottom: orderListLabel.bottomAnchor, left: 100, size: 25)
        configureSwitches(switchComp: payByCardSwitch, bottom: orderListLabel.bottomAnchor, top: 30, right: -30)
        configureLabels(label: payByCashlabel, text: "Pay by cash 💵", bottom: payByCardLabel.bottomAnchor, left: 100, size: 25)
        configureSwitches(switchComp: payByCashSwitch, bottom: payByCardSwitch.bottomAnchor, top: 30, right: -30)
        configureButton()
        
    }
    
    private func configureView () {
        view.backgroundColor = .white
    }
    
    private func addOrderItems () {
        orderListLabel.text = "Your order:"
        orderListLabel.text! += "\n\n1) Pizza \(nameOfChosenPizza!)"
        
        for item in components {
            orderListLabel.text! += "\n\n\(components.firstIndex(of: item)!+2)) \(item)"
        }
        if let totalSum = total {
            orderListLabel.text! += "\n\n\nTotal: \(totalSum)"
        }
    }
    
    @objc private func payPressed () {
        alertThanksForOrder()
    }
    
    private func alertThanksForOrder () {
        let alert = UIAlertController(title: "Thanks for your order!", message: "The delivery will be in 30 min ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
    
    private func configureOrderListLabel () {
        view.addSubview(orderListLabel)
        orderListLabel.translatesAutoresizingMaskIntoConstraints = false
        orderListLabel.textColor = .black
        orderListLabel.font = UIFont(name: "InstrumentSerif-Italic", size: 25)
        orderListLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            orderListLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            orderListLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            orderListLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    private func configureLabels (label : UILabel, text: String, bottom: NSLayoutYAxisAnchor, left: CGFloat, size: CGFloat) {
        view.addSubview(label)
        
        label.text = text
        label.textColor = .orange
        label.font = UIFont(name: "InstrumentSerif-Italic", size: size)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: bottom, constant: 15),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: left),
            label.heightAnchor.constraint(equalToConstant: 70),
            label.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureSwitches (switchComp : UISwitch, bottom: NSLayoutYAxisAnchor, top: CGFloat, right: CGFloat) {
        view.addSubview(switchComp)
        
        switchComp.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            switchComp.topAnchor.constraint(equalTo: bottom, constant: top),
            switchComp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: right),
            switchComp.heightAnchor.constraint(equalToConstant: 70),
            switchComp.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func configureButton () {
        view.addSubview(payButton)
        
        payButton.backgroundColor = .orange
        payButton.setTitle("PAY", for: .normal)
        payButton.setTitleColor(.white, for: .normal)
        payButton.layer.cornerRadius = 20
        payButton.layer.shadowOpacity = 0.5
        payButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            payButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            payButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            payButton.heightAnchor.constraint(equalToConstant: 50),
            payButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        payButton.addTarget(self, action: #selector(payPressed), for: .touchUpInside)
    }
    
    
}
