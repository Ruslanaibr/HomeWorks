//
//  RegistrationViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 22.04.2023.
//

import UIKit

class RegistrationViewController : UIViewController {
    
    var delegate               = BirthdayViewController()
    private let textFieldName  = UITextField()
    private let textFieldBirth = UITextField()
    private let textFieldAge   = UITextField()
    private let textFieldSex   = UITextField()
    private let textFieldInst  = UITextField()
    private let image          = UIImageView()
    private let labelAddImage  = UILabel()
    private let labelName      = UILabel()
    private let labelDate      = UILabel()
    private let labelBirth     = UILabel()
    private let labelAge       = UILabel()
    private let labelSex       = UILabel()
    private let labelInst      = UILabel()
    private let buttonInst     = UIButton()
    private let pickerDateOfBirth = UIDatePicker()
    private let pickerAge      = UIPickerView()
    private let pickerSex      = UIPickerView()
    private let ageArray       = Array(5...100)
    private let sexArray       = ["Female", "Male"]
    private var instUsername   : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor                = Const.Colors.milky
        
        navigationItem.leftBarButtonItem    = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))
        
        navigationItem.rightBarButtonItem   = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonPressed))
        
        setupLayouts()
    }
    
    private func setupLayouts () {
        configureImage()
        configureLabels(label: labelAddImage, title: "Add photo", size: 17, under: image, leading: 150)
        configureLabels(label: labelName, title: "Name", size: 17, under: labelAddImage, leading: 30)
        configureTxtFields(field: textFieldName, placeholder: "Enter the name...", under: labelName, inputView: nil)
        configureLabels(label: labelDate, title: "Date of Birth", size: 17, under: textFieldName, leading: 30)
        configureDatePicker()
        configureTxtFields(field: textFieldBirth, placeholder: "Choose date of the birth", under: labelDate, inputView: pickerDateOfBirth)
        configureLabels(label: labelAge, title: "Age", size: 17, under: textFieldBirth, leading: 30)
        configureAgePicker()
        configureTxtFields(field: textFieldAge, placeholder: "Choose age", under: labelAge, inputView: pickerAge)
        configureLabels(label: labelSex, title: "Sex", size: 17, under: textFieldAge, leading: 30)
        configureSexPicker()
        configureTxtFields(field: textFieldSex, placeholder: "Choose sex", under: labelSex, inputView: pickerSex)
        configureLabels(label: labelInst, title: "Instagram", size: 17, under: textFieldSex, leading: 30)
        configureInstButton ()
    }
    
    
    // Cancel button
    @objc func cancelButtonPressed () {
        navigationController?.popViewController(animated: true)
    }
    
    // Add button
    @objc func addButtonPressed () {
        if let name = textFieldName.text,  let dateOfBirth = textFieldBirth.text,  let age = textFieldAge.text, let sex = textFieldSex.text, let inst = instUsername {
            delegate.addNewPerson(name: name , dateOfBirth: dateOfBirth, age: age, sex: sex, instagram: inst)
            navigationController?.popViewController(animated: true)
        } else {
            alertWarningEmpty()
        }
    }
    
    //Instagram Button
    
    @objc func instButtonPressed (param: UIButton) {
        alertInst()
    }
    
    //Alert Warning empty field
    
    
    private func alertWarningEmpty () {
        
        let alert = UIAlertController(title: "There are empty fields! Please fill in these fields.", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Understand", style: .default))
            present(alert, animated: true)
    }
    
    // Alert for Instagram username
    private func alertInst () {
        let alert = UIAlertController(title: "Enter the Instagram username ", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { action in
            if let text = alert.textFields?[0].text {
                self.instUsername = text
                self.buttonInst.setTitle("@\(text)", for: .normal)
            }
        }))
        alert.addTextField()
        present(alert, animated: true)
    }
    
    // Date picker
    private func configureDatePicker () {
        pickerDateOfBirth.preferredDatePickerStyle = .inline
        pickerDateOfBirth.addTarget(self, action: #selector(chooseDate(param:)), for: .valueChanged)
    }
    
    @objc private func chooseDate (param: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        let stringDate = dateFormatter.string(from: param.date)
        textFieldBirth.text = stringDate
    }
    
    //Age Picker
    
    private func configureAgePicker () {
        pickerAge.delegate   = self
        pickerAge.dataSource = self
        pickerAge.tag        = 1
    }
    //Sex picker
    
    private func configureSexPicker () {
        pickerSex.delegate   = self
        pickerSex.dataSource = self
        pickerSex.tag        = 2
    }
    
    //Configure Person Image
    private func configureImage () {
        
        view.addSubview(image)
        
        image.image                                     = UIImage(systemName: "person.crop.circle.badge.plus")
        image.contentMode                               = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor                                 = Const.Colors.purple
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            image.heightAnchor.constraint(equalToConstant: 90),
            image.widthAnchor.constraint(equalToConstant: 90)
        ])
        
    }
    
    // Congigure Labels and Constraints
    private func configureLabels (label : UILabel, title : String, size : Int, under layout: UIView, leading: Int) {
        view.addSubview(label)
        
        label.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 70, height: 150))
        label.text      = title
        label.textColor = Const.Colors.purple
        label.font      = .boldSystemFont(ofSize: CGFloat(size))
        
        addConstraintsLabels(label: label, under: layout, leading: leading)
    }
    
    private func addConstraintsLabels (label: UILabel, under layout: UIView, leading: Int) {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: layout.bottomAnchor , constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(leading))
        ])
    }
    
    // Congigure Text Fields and Constraints
    private func configureTxtFields (field: UITextField, placeholder: String, under layout: UIView, inputView: UIView?) {
        view.addSubview(field)
        
        field.placeholder       = placeholder
        field.borderStyle       = .roundedRect
        field.layer.borderColor = Const.Colors.purple.cgColor
        field.layer.borderWidth = 0.15
        if let view = inputView {
            field.inputView     = view
        }
        addConstraintsTF(field: field, under: layout)
    }
    
    private func addConstraintsTF (field: UITextField, under layout: UIView) {
        field.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
           field.topAnchor.constraint(equalTo: layout.bottomAnchor , constant: 10),
           field.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           field.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    
    //Configure inst button
    
    func configureInstButton () {
        view.addSubview(buttonInst)
        
        buttonInst.translatesAutoresizingMaskIntoConstraints = false
        buttonInst.setTitle("Enter instagram username ...", for: .normal)
        buttonInst.layer.borderColor = Const.Colors.purple.cgColor
        buttonInst.layer.borderWidth = 0.1
        buttonInst.backgroundColor = .white
        buttonInst.setTitleColor(.systemGray, for: .normal)
        buttonInst.layer.cornerRadius = 8
        

        
        NSLayoutConstraint.activate([
            buttonInst.topAnchor.constraint(equalTo: labelInst.bottomAnchor, constant: 10),
            buttonInst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonInst.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        buttonInst.addTarget(self, action: #selector(instButtonPressed(param:)), for: .touchUpInside)
    }
}


extension RegistrationViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1: return String(ageArray[row])
        case 2 : return sexArray[row]
        default: return "?"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1 : textFieldAge.text = String(ageArray[row])
        case 2:  textFieldSex.text = String(sexArray[row])
        default: break
        }
    }
}

extension RegistrationViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1 : return ageArray.count
        case 2 : return sexArray.count
        default: return 0
        }
    }
    
    
}
