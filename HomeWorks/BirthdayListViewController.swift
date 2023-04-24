//
//  BirthdayListViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 22.04.2023.
//

import UIKit

protocol BirthdayViewControllerDelegate {
    func addNewPerson (name: String, dateOfBirth: String, age: String, sex: String, instagram: String)
}

final class BirthdayViewController : UIViewController, BirthdayViewControllerDelegate {
    
    
    let addButton             = UIButton()
    var nameU                  : String?
    let stackOfCells          = UIStackView()
    let stackCell             = UIStackView()
    let stackOfLabelAndLabels = UIStackView()
    let stackOfLabels         = UIStackView()
    let imagePerson           = UIImageView()
    var labelName             = UILabel()
    var labelDescription      = UILabel()
    let labelDays             = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Const.Colors.milky
        title                = "Birthday"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
    }
    
    func addNewPerson(name: String, dateOfBirth: String, age: String, sex: String, instagram  : String) {
        labelName.text = name
        labelDescription.text = "\(dateOfBirth) , age : \(age), sex: \(sex)"
        setupLayouts()
    }
    
    
    func setupLayouts () {
        configureStack()
    }
    
    @objc func addButtonPressed () {
        navigationController?.pushViewController(RegistrationViewController(), animated: true)
    }
    
    func configureStack () {
        view.addSubview(stackOfCells)
        
        //Вертикальный главный стек
        stackOfCells.axis         = .vertical
        stackOfCells.addArrangedSubview(stackCell)
        
        //Горизонтальный Стек с фото и вертикальным стеком
        stackCell.axis            = .horizontal
        stackCell.distribution    = .equalCentering
        stackCell.spacing         = 5
        stackCell.addArrangedSubview(imagePerson)
        stackCell.addArrangedSubview(stackOfLabelAndLabels)
        
        imagePerson.image         = UIImage(systemName: "person.crop.rectangle")
        imagePerson.contentMode   = .scaleAspectFit
        imagePerson.widthAnchor.constraint(equalToConstant: view.frame.size.width/5).isActive = true
        imagePerson.tintColor     = Const.Colors.purple
    
        // Вертикальный стек с лейблом и горизонтальным стеком
        stackOfLabelAndLabels.addArrangedSubview(stackOfLabels)
        stackOfLabelAndLabels.addArrangedSubview(labelDescription)
        stackOfLabelAndLabels.axis         = .vertical
        stackOfLabelAndLabels.distribution = .fillEqually
        stackOfLabelAndLabels.spacing      = 10
        
        stackOfLabels.addArrangedSubview(labelName)
        stackOfLabels.addArrangedSubview(labelDays)
        stackOfLabels.axis = .horizontal
        stackOfLabels.distribution = .fillEqually
        stackOfLabels.spacing = 10
        
        labelName.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        
        
        labelDays.text = "18 days"
        
        
        labelDescription.numberOfLines = 0
        
        
        addStackConstraints()
    }
    
    func addStackConstraints () {
        stackOfCells.translatesAutoresizingMaskIntoConstraints = false
        stackOfCells.frame = view.bounds
        
        NSLayoutConstraint.activate([
        stackOfCells.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
        stackOfCells.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        ])
    }
}
