//
//  BillViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 20.04.2023.
//

import Foundation
import UIKit

class BillViewController : UIViewController {
    
    private var tableViewBill = UITableView()
    private let button = UIButton()
    private let arrayBill = ["Mac and cheese", "Chicken", "Salad fish", "Potatoes" , "Apple juice" , "Mohito no alco" ]
    private let identifier = "Cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    func setupLayouts () {
        configureView()
        configureTableView()
        configureButton()
    }
    
    
    //MARK: Configure Views
    
    func configureView() {
        view.backgroundColor = .white
        title = "Bill"
    }
    
    func configureTableView() {
        
        tableViewBill = UITableView(frame: view.bounds, style: .plain)
        
        tableViewBill.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableViewBill.dataSource = self
        tableViewBill.delegate = self
        
        tableViewBill.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        view.addSubview(tableViewBill)
    }
    
    func configureButton () {
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("total : 100.000 $", for: .normal)
        button.backgroundColor = UIColor(red: 134/255, green: 112/255, blue: 112/255, alpha: 1)
        button.layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 80),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
}


extension BillViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayBill.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = arrayBill[indexPath.row]
        return cell
    }
}



extension BillViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
