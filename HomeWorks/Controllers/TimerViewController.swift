//
//  TimerViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 01.05.2023.
//

import UIKit

final class TimerViewController: UIViewController {
    
    
    private lazy var stopwatchPicker: UIPickerView = {
        let picker        = UIPickerView()
        picker.delegate   = self
        picker.dataSource = self
        return picker
    }()
    
    private lazy var cancelButton: CustomButton = {
        let button = CustomButton()
        button.configure(type: .cancel)
        return button
    }()
    
    private lazy var startButton: CustomButton = {
        let button = CustomButton()
        button.configure(type: .start)
        return button
    }()
    
    private lazy var whenTimerEndsLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .whenTimerEnds)
        return label
    }()
    
    private lazy var radarLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .radar)
        return label
    }()
    
    let hours   = Array(0...23)
    let minutes = Array(0...59)
    let seconds = Array(0...59)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    private func setupLayouts () {
        configureView()
        setupStopwatchPicker()
        setupStartButton()
        setupCancelButton()
        setupWhenTimerEnds()
        setupRadar()
    }
    
    private func configureView () {
        view.backgroundColor = .black
        addSubviews([stopwatchPicker, cancelButton, startButton, whenTimerEndsLabel, radarLabel])
        translateAuthMaskOff([stopwatchPicker, cancelButton, startButton, whenTimerEndsLabel, radarLabel])
    }
    
    //Setup Stopwatch Picker
    private func setupStopwatchPicker() {
        NSLayoutConstraint.activate([
            stopwatchPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stopwatchPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    //Setup Buttons
    private func setupCancelButton () {
        NSLayoutConstraint.activate([
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            cancelButton.topAnchor.constraint(equalTo: stopwatchPicker.bottomAnchor, constant: 50),
            cancelButton.heightAnchor.constraint(equalToConstant: 90),
            cancelButton.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    private func setupStartButton () {
        NSLayoutConstraint.activate([
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            startButton.topAnchor.constraint(equalTo: stopwatchPicker.bottomAnchor, constant: 50),
            startButton.heightAnchor.constraint(equalToConstant: 90),
            startButton.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    //Setup Labels
    
    private func setupWhenTimerEnds () {
        NSLayoutConstraint.activate([
            whenTimerEndsLabel.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 30),
            whenTimerEndsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
    }
    
    private func setupRadar () {
        NSLayoutConstraint.activate([
            radarLabel.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 30),
            radarLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
}

extension TimerViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        switch component {
        case 0:
            return NSAttributedString(string: "\(hours[row]) h", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        case 1:
            return NSAttributedString(string: "\(minutes[row]) min", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        case 2:
            return NSAttributedString(string: "\(seconds[row]) sec", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        default:
            return nil
        }
    }
}
        
extension TimerViewController : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return hours.count
        case 1:
            return minutes.count
        case 2:
            return seconds.count
        default:
            return 0
        }
    }
}
