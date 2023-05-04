//
//  OtherSettingsViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 04.05.2023.
//

import UIKit

final class OtherSettingsViewController: UIViewController {
    
    
    //Labels
    private lazy var numberOfLinesLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .numberOfLines)
        return label
    }()
    
    private lazy var colorLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .color)
        return label
    }()
    
    private lazy var shadowsLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .shadows)
        return label
    }()
    
    //Pickers
    private lazy var numberOfLinesPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate   = self
        picker.dataSource = self
        picker.tag = 1
        return picker
    }()
    
    private lazy var colorPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate   = self
        picker.dataSource = self
        picker.tag = 2
        return picker
    }()
    
    //Switch
    
    private lazy var shadowSwitch: UISwitch = {
        let shadowSwitch = UISwitch()
        shadowSwitch.addTarget(self, action: #selector(shadowSwitchChanged(param:)), for: .valueChanged)
        return shadowSwitch
    }()
    
    
    private let arrayOfNumbersOfLine = [0, 1, 2]
    private let arrayOfColors       = [UIColor.black, UIColor.green, UIColor.dirtyBlue, UIColor.pinky, UIColor.lightyGray, UIColor.lightBlue, UIColor.violet, UIColor.turquoise]
    private let arrayOfNamesOfColors = ["Black", "Green", "Dirty Blue", "Pinky", "Lighty Gray", "LightBlue", "Violet", "Turquoise"]
    
    private var chosenNumberOfLines: Int?
    private var chosenColor: UIColor?
    private var chosenIsShadowOn: Bool?
    
    

    //ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupLayouts()
    }
    
    private func configureView () {
        view.backgroundColor = .white
        addSubviews([numberOfLinesLabel, numberOfLinesPicker, colorLabel, colorPicker, shadowsLabel, shadowSwitch])
        translateAuthMaskOff([numberOfLinesLabel, numberOfLinesPicker, colorLabel, colorPicker, shadowsLabel, shadowSwitch])
    }

    private func setupLayouts() {
        setupNumberOfLinesLabel()
        setupNumberOfLinesPicker()
        setupColorlabel()
        setupColorPicker()
        setupShadowLabel()
        setupShadowSwitch()
    }
    
    @objc private func shadowSwitchChanged (param: UISwitch) {
        LabelSettings.shared().isShadowOn = shadowSwitch.isOn
    }
    
    
    //Setup Labels
    private func setupNumberOfLinesLabel() {
        NSLayoutConstraint.activate([
            numberOfLinesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            numberOfLinesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            numberOfLinesLabel.widthAnchor.constraint(equalToConstant: 200),
            numberOfLinesLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupColorlabel() {
        NSLayoutConstraint.activate([
           colorLabel.topAnchor.constraint(equalTo: numberOfLinesPicker.bottomAnchor, constant: 20),
           colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           colorLabel.widthAnchor.constraint(equalToConstant: 110),
           colorLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupShadowLabel() {
        NSLayoutConstraint.activate([
            shadowsLabel.topAnchor.constraint(equalTo: colorPicker.bottomAnchor, constant: 20),
           shadowsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           shadowsLabel.widthAnchor.constraint(equalToConstant: 200),
           shadowsLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    //Setup Pickers
    private func setupNumberOfLinesPicker() {
        NSLayoutConstraint.activate([
           numberOfLinesPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           numberOfLinesPicker.topAnchor.constraint(equalTo: numberOfLinesLabel.bottomAnchor, constant: 10),
           numberOfLinesPicker.widthAnchor.constraint(equalToConstant: 200),
           numberOfLinesPicker.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setupColorPicker() {
        NSLayoutConstraint.activate([
          colorPicker.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 5),
          colorPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
          colorPicker.widthAnchor.constraint(equalToConstant: 200),
          colorPicker.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    //Setup Switch
    
    private func setupShadowSwitch () {
        NSLayoutConstraint.activate([
           shadowSwitch.topAnchor.constraint(equalTo: shadowsLabel.bottomAnchor, constant: 5),
           shadowSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           shadowSwitch.widthAnchor.constraint(equalToConstant: 200),
           shadowSwitch.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}

extension OtherSettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return "\(arrayOfNumbersOfLine[row])"
        case 2:
            return "\(arrayOfNamesOfColors[row])"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1: LabelSettings.shared().numberOfLines = arrayOfNumbersOfLine[row]
        case 2: LabelSettings.shared().color         = arrayOfColors[row]
        default: break
        }
    }
}

extension OtherSettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return arrayOfNumbersOfLine.count
        case 2:
            return arrayOfColors.count
        default:
            return 0
        }
    }
    
    
}
