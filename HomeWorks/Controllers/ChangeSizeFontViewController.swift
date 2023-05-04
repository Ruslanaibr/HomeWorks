//
//  ChangeSettingsViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 04.05.2023.
//

import UIKit


final class ChangeSizeFontViewController: UIViewController {

    //labels
    private lazy var labelToChange: CustomLabel = {
        let label  = CustomLabel()
        label.configure(type: .label)
        return label
    }()
    
    private lazy var sizeLabel: CustomLabel = {
        let label  = CustomLabel()
        label.configure(type: .size)
        return label
    }()
    
    private lazy var fontLabel: CustomLabel = {
        let label  = CustomLabel()
        label.configure(type: .font)
        return label
    }()
    
    //Slider
    private lazy var sizeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 70
        slider.value        = Float(labelToChange.font.pointSize)
        slider.addTarget(self, action: #selector(sizeSliderChanged(param:)), for: .valueChanged)
        return slider
    }()
    
    //Picker
    private lazy var fontPicker: UIPickerView = {
        let picker        = UIPickerView()
        picker.delegate   = self
        picker.dataSource = self
        return picker
    }()
    
    private let arrayOfFonts = ["Sacramento", "Zeyada", "Gruppo", "Great Vibes", "Bruno Ace SC", "Castoro Titling", "Caveat", "Dancing Script", "Genos Thin"]
    
    
    
    //View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    //View will appear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        labelToChange.textColor = LabelSettings.shared().color
        
        labelToChange.numberOfLines = LabelSettings.shared().numberOfLines
        
        if LabelSettings.shared().isShadowOn {
            labelToChange.layer.shadowOpacity = 0.5
        } else {
            labelToChange.layer.shadowOpacity = 0
        }
    }
    
    private func setupLayouts() {
        configureView()
        setupLabelToChange()
        setupSizeLabel()
        setupSizeSlider()
        setupFontLabel()
        setupFontPicker()
    }
    
    private func configureView () {
        view.backgroundColor = .white
        
        addSubviews([labelToChange, sizeLabel, sizeSlider, fontLabel, fontPicker])
        translateAuthMaskOff([labelToChange, sizeLabel, sizeSlider, fontLabel, fontPicker])
        addNavigationItems()
    }
    
    private func addNavigationItems () {
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(alertToAddText))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    //Methods when user interacts with
    @objc private func alertToAddText () {
        let alert = UIAlertController(title: "Enter the text you want to change here", message: nil, preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Enter", style: .cancel, handler: { action in
            if let text = alert.textFields?[0].text {
                self.labelToChange.text = text
            }
        }))
        present(alert, animated: true)
    }
    
    @objc private func sizeSliderChanged (param: UISlider) {
        labelToChange.font = labelToChange.font.withSize(CGFloat(param.value))
    }
    
    //Update LabelToChange
    
    
    
    
    //Setup Labels
    private func setupLabelToChange () {
        NSLayoutConstraint.activate([
            labelToChange.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelToChange.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            labelToChange.widthAnchor.constraint(equalToConstant: 350),
            labelToChange.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupSizeLabel () {
        NSLayoutConstraint.activate([
            sizeLabel.topAnchor.constraint(equalTo: labelToChange.bottomAnchor, constant: 60),
            sizeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            sizeLabel.widthAnchor.constraint(equalToConstant: 200),
            sizeLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupFontLabel () {
        NSLayoutConstraint.activate([
            fontLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            fontLabel.topAnchor.constraint(equalTo: sizeSlider.bottomAnchor, constant: 30),
            fontLabel.widthAnchor.constraint(equalToConstant: 200),
            fontLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    //Setup Size Slider
    
    private func setupSizeSlider () {
        NSLayoutConstraint.activate([
            sizeSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            sizeSlider.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 10),
            sizeSlider.widthAnchor.constraint(equalToConstant: 320)
        ])
    }
    
    //Setup Font Picker
    
    private func setupFontPicker () {
        NSLayoutConstraint.activate([
            fontPicker.topAnchor.constraint(equalTo: fontLabel.bottomAnchor, constant: 5),
            fontPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            fontPicker.heightAnchor.constraint(equalToConstant: 120),
            fontPicker.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}

extension ChangeSizeFontViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayOfFonts[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelToChange.font = UIFont(name: arrayOfFonts[row], size: labelToChange.font.pointSize)
    }
}

extension ChangeSizeFontViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayOfFonts.count
    }
}
