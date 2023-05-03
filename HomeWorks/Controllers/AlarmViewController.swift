//
//  AlarmViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 01.05.2023.
//

import UIKit

final class AlarmViewController: UIViewController {
    
    //Text Labels
    
    private lazy var alarmLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .alarmHead)
        return label
    }()
    
    private lazy var sleepLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .sleep)
        return label
    }()
    
    private lazy var noAlarmLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .noAlarm)
        return label
    }()
    
    private lazy var otherLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .other)
        return label
    }()
    
    private lazy var alarmTimeFirstLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .alarmTimeFirst)
        return label
    }()
    
    private lazy var alarmLowercaseFirst: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .alarmLowercase)
        return label
    }()
    
    private lazy var alarmTimeSecondLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .alarmTimeSecond)
        return label
    }()
    
    private lazy var alarmLowercaseSecond: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .alarmLowercase)
        return label
    }()
    
    private lazy var alarmTimeThirdLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .alarmTimeThird)
        return label
    }()
    
    private lazy var alarmLowercaseThird: CustomLabel = {
        let label = CustomLabel()
        label.configure(type: .alarmLowercase)
        return label
    }()
    
    //Switches
    
    private lazy var isFirstAlarmOnSwitch: UISwitch = {
        let alarmSwitch = UISwitch()
        alarmSwitch.isOn = false
        return alarmSwitch
    }()
    
    private lazy var isSecondAlarmOnSwitch: UISwitch = {
        let alarmSwitch = UISwitch()
        alarmSwitch.isOn = false
        return alarmSwitch
    }()
    
    private lazy var isThirdAlarmOnSwitch: UISwitch = {
        let alarmSwitch = UISwitch()
        alarmSwitch.isOn = false
        return alarmSwitch
    }()
    
    //ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    //Setup all layouts
    
    private func setupLayouts () {
        configureView()
        addNavigationItems()
        setupLabels()
        setupSwitches()
    }
    
    private func configureView () {
        view.backgroundColor             = .black
        addSubviews([alarmLabel, sleepLabel, noAlarmLabel, otherLabel, alarmTimeFirstLabel, alarmTimeSecondLabel, alarmTimeThirdLabel, alarmLowercaseFirst, alarmLowercaseSecond, alarmLowercaseThird, isFirstAlarmOnSwitch, isSecondAlarmOnSwitch, isThirdAlarmOnSwitch])
    }
    
    //Add Navigation items to the navigationBar
    
    private func addNavigationItems () {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem?.tintColor  = .orange
        navigationItem.rightBarButtonItem            = UIBarButtonItem(systemItem: .add)
        navigationItem.rightBarButtonItem?.tintColor = .orange
    }

    
    //Setup Labels
    
    private func setupLabels () {
        
        setupAlarmLabel()
        setupSleepLabel()
        setupNoAlarmLabel()
        setupOtherLabel()
        setupAlarmTimeFirstLabel()
        setupAlarmLowercaseFirst()
        setupAlarmTimeSecondLabel()
        setupAlarmLowercaseSecond()
        setupAlarmTimeThirdLabel()
        setupAlarmLowercaseThird()
        
        addDividers()
    }
    
    
    private func setupAlarmLabel () {
        NSLayoutConstraint.activate([
            alarmLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            alarmLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    private func setupSleepLabel () {
        NSLayoutConstraint.activate([
            sleepLabel.topAnchor.constraint(equalTo: alarmLabel.bottomAnchor, constant: 20 ),
            sleepLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    private func setupNoAlarmLabel () {
        NSLayoutConstraint.activate([
            noAlarmLabel.topAnchor.constraint(equalTo: sleepLabel.bottomAnchor , constant: 30),
            noAlarmLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    private func setupOtherLabel () {
        NSLayoutConstraint.activate([
            otherLabel.topAnchor.constraint(equalTo:noAlarmLabel.bottomAnchor , constant: 40),
            otherLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    private func setupAlarmTimeFirstLabel () {
        NSLayoutConstraint.activate([
            alarmTimeFirstLabel.topAnchor.constraint(equalTo: otherLabel.bottomAnchor , constant: 20),
            alarmTimeFirstLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    private func setupAlarmLowercaseFirst () {
        NSLayoutConstraint.activate([
            alarmLowercaseFirst.topAnchor.constraint(equalTo: alarmTimeFirstLabel.bottomAnchor , constant: 3),
            alarmLowercaseFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    private func setupAlarmTimeSecondLabel () {
        NSLayoutConstraint.activate([
            alarmTimeSecondLabel.topAnchor.constraint(equalTo: alarmLowercaseFirst.bottomAnchor , constant: 30),
            alarmTimeSecondLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    private func setupAlarmLowercaseSecond () {
        NSLayoutConstraint.activate([
            alarmLowercaseSecond.topAnchor.constraint(equalTo: alarmTimeSecondLabel.bottomAnchor , constant: 3),
            alarmLowercaseSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    private func setupAlarmTimeThirdLabel () {
        NSLayoutConstraint.activate([
            alarmTimeThirdLabel.topAnchor.constraint(equalTo: alarmLowercaseSecond.bottomAnchor , constant: 30),
            alarmTimeThirdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    private func setupAlarmLowercaseThird () {
        NSLayoutConstraint.activate([
            alarmLowercaseThird.topAnchor.constraint(equalTo: alarmTimeThirdLabel.bottomAnchor , constant: 3),
            alarmLowercaseThird.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    //Add dividers
    private func addDividers () {
        let viewsNeedDividerUnder = [noAlarmLabel, sleepLabel, otherLabel, alarmLowercaseFirst, alarmLowercaseSecond,alarmLowercaseThird]
        for viewNeedDivider in viewsNeedDividerUnder {
            configureDivider(bottomAnchor: viewNeedDivider.bottomAnchor)
        }
    }
    
    private func configureDivider (bottomAnchor: NSLayoutYAxisAnchor) {
        let divider = CustomImage()
        divider.configure(type: .separator)
        view.addSubview(divider)
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            divider.widthAnchor.constraint(equalToConstant: view.bounds.width)
        ])
    }
    
    
    //Setup Switches
    
    private func setupSwitches () {
        setupIsFirstAlarmOn()
        setupIsSecondAlarmOn()
        setupIsThirdAlarmOn()
        configureSwitches()
    }
    
    private func setupIsFirstAlarmOn () {
        NSLayoutConstraint.activate([
            isFirstAlarmOnSwitch.topAnchor.constraint(equalTo: otherLabel.bottomAnchor , constant: 50),
            isFirstAlarmOnSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupIsSecondAlarmOn () {
        NSLayoutConstraint.activate([
            isSecondAlarmOnSwitch.topAnchor.constraint(equalTo: isFirstAlarmOnSwitch.bottomAnchor , constant: 90),
            isSecondAlarmOnSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupIsThirdAlarmOn () {
        NSLayoutConstraint.activate([
            isThirdAlarmOnSwitch.topAnchor.constraint(equalTo: isSecondAlarmOnSwitch.bottomAnchor , constant: 90),
            isThirdAlarmOnSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func configureSwitches() {
        [isFirstAlarmOnSwitch, isSecondAlarmOnSwitch, isThirdAlarmOnSwitch].forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
    }
}
