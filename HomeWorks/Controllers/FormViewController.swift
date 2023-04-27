//
//  FormViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 26.04.2023.
//

import UIKit

class FormViewController: UIViewController {
    
    var fee : Float?
    private let separator    = UIImageView(image: UIImage(named: "separator"))
    private let labelName    = UILabel()
    private let txtName      = UITextField()
    private let labelSurname = UILabel()
    private let txtSurname   = UITextField()
    private let labelFee     = UILabel()
    private let txtFee       = UITextField()
    private let txtCredit    = UITextField()
    private let labelCredit  = UILabel()
    private let picker       = UIPickerView()
    private let arrayPicker  = ["Сredit", "Cash"]
    private let goButton     = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    private func setupLayouts () {
        congigureView()
        configureSeparator()
        configureLabels(label: labelName, title: "Your name:", size: 20, under: separator, leading: 20)
        configureTxtFields(field: txtName, placeholder: "Alexandr", under: labelName, inputView: nil)
        configureLabels(label: labelSurname, title: "Your surname", size: 20, under: txtName, leading: 20)
        configureTxtFields(field: txtSurname, placeholder: "Ivanov", under: labelSurname, inputView: nil)
        configureLabels(label: labelFee, title: "Your initial fee is", size: 20, under: txtSurname, leading: 20)
        configureTxtFields(field: txtFee, placeholder: "", under: labelFee, inputView: nil)
        if let f = fee {
            txtFee.text = "\(Int(f))"
        }
        configurePicker()
        configureLabels(label: labelCredit, title: "Credit or cash?", size: 20, under: txtFee, leading: 20)
        configureTxtFields(field: txtCredit, placeholder: "Credit/Cash", under: labelCredit, inputView: picker)
        configureGoButton()
    }
    
    //По нажатию на кнопку вызывается алерт
    @objc func applyPressed () {
        alertApply()
    }
    
    //Благодарственный алерт, переход к предыдущему контроллеру
    private func alertApply () {
        let alert = UIAlertController(title: K.TextForm.alert, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Thanks", style: .default, handler: { action in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true)
    }
    
    //Насйтройка пикера
    private func configurePicker () {
        picker.delegate = self
        picker.dataSource = self
    }
    
    //Настройка view
    private func congigureView () {
        view.backgroundColor = K.Color.lightBlue
    }
    
    //Настройка лейблов
    private func configureLabels (label : UILabel, title : String, size : Int, under layout: UIView, leading: Int) {
        view.addSubview(label)
        
        label.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 70, height: 150))
        label.text      = title
        label.textColor = K.Color.gray
        label.font      = UIFont(name: "Orbitron", size: CGFloat(size))
        
        addConstraintsLabels(label: label, under: layout, leading: leading)
    }
    
    //Добавление констрейтов для лейблов
    private func addConstraintsLabels (label: UILabel, under layout: UIView, leading: Int) {
            label.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: layout.bottomAnchor , constant: 20),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(leading))
            ])
        }
    
    //Настройка текстфилдов
    private func configureTxtFields (field: UITextField, placeholder: String, under layout: UIView, inputView: UIView?) {
            view.addSubview(field)
            
            field.placeholder       = placeholder
            field.borderStyle       = .roundedRect
            field.layer.borderColor = K.Color.gray.cgColor
            field.layer.borderWidth = 0.15
            if let view = inputView {
                field.inputView     = view
            }
            addConstraintsTF(field: field, under: layout)
        }
    
    //Констрейты для текстфилдов
    private func addConstraintsTF (field: UITextField, under layout: UIView) {
            field.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
               field.topAnchor.constraint(equalTo: layout.bottomAnchor , constant: 10),
               field.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
               field.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        }
    
    //Настройка разделителя
    private func configureSeparator () {
        view.addSubview(separator)
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 10),
           separator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           separator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    
    //Настройка кнопки
    private func configureGoButton () {
        view.addSubview(goButton)
        
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.setTitle("Apply", for: .normal)
        goButton.backgroundColor = K.Color.gray
        goButton.layer.cornerRadius = 20
        goButton.layer.shadowOpacity = 0.7
        
        NSLayoutConstraint.activate([
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            goButton.heightAnchor.constraint(equalToConstant: 60),
            goButton.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        goButton.addTarget(self, action: #selector(applyPressed), for: .touchUpInside)
    }
}


//Методы UIPickerViewDelegate, UIPickerViewDataSource
extension FormViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayPicker[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtCredit.text = arrayPicker[row]
    }
}
