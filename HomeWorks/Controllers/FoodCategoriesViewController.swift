//
//  FoodCategoriesViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 27.04.2023.
//

import UIKit

final class FoodCategoriesViewController: UIViewController {
    
    
    private let pizzaButton = UIButton()
    
    private let sushiButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    private func setupLayouts () {
        configureView()
        configurePizzaButton()
        configureSushiButton()
    }
    
    @objc private func pizzaPressed () {
        navigationController?.pushViewController(PizzaListViewController(), animated: true)
    }
    
    private func configureView () {
        title = "Food"
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
    }
    
    private func configurePizzaButton () {
        view.addSubview(pizzaButton)
        
        pizzaButton.setTitle("Pizza 🍕", for: .normal)
        pizzaButton.setTitleColor(.black, for: .normal)
        pizzaButton.titleLabel?.font = UIFont(name: "InstrumentSerif-Italic", size: 40)
        pizzaButton.frame = CGRect(x: 30, y: 130, width: 330, height: 140)
        pizzaButton.layer.borderWidth = 1
        
        pizzaButton.addTarget(self, action: #selector(pizzaPressed), for: .touchUpInside)
        
    }
    
    private func configureSushiButton () {
        view.addSubview(sushiButton)
        
        sushiButton.setTitle("Sushi 🍣", for: .normal)
        sushiButton.setTitleColor(.black, for: .normal)
        sushiButton.titleLabel?.font = UIFont(name: "InstrumentSerif-Italic", size: 40)
        sushiButton.frame = CGRect(x: 30, y: 130 + 140 + 20, width: 330, height: 140)
        sushiButton.layer.borderWidth = 1
    }

}
