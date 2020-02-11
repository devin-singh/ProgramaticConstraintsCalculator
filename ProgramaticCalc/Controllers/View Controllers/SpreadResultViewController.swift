//
//  SpreadResultViewController.swift
//  ProgramaticCalc
//
//  Created by Devin Singh on 2/11/20.
//  Copyright © 2020 Devin Singh. All rights reserved.
//

import UIKit

class SpreadResultViewController: UIViewController {
    
    // MARK: - Properties
    
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    // MARK: - Lifecycle Functions
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        addAllSubviews()
        setUpStackView()
        constrainViews()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        activateButton()
    }
    
    // MARK: - Subviews
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Result Will be Displayed Here"
        label.textAlignment = .center
        return label
    }()
    
    let buyStrikeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Buy Strike"
        textField.textAlignment = .center
        textField.contentHorizontalAlignment = .center
        return textField
    }()
    
    let sellStrikeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Sell Strike"
        textField.textAlignment = .center
        textField.contentHorizontalAlignment = .center
        return textField
    }()
    
    let limitPriceTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter limit price"
        textField.textAlignment = .center
        textField.contentHorizontalAlignment = .center
        return textField
    }()
    
    let popTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter POP as %"
        textField.textAlignment = .center
        textField.contentHorizontalAlignment = .center
        return textField
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .center
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    let sceneStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    
    // MARK: - Private Functions
    
    func addAllSubviews() {
        self.view.addSubview(resultLabel)
        self.view.addSubview(buyStrikeTextField)
        self.view.addSubview(sellStrikeTextField)
        self.view.addSubview(limitPriceTextField)
        self.view.addSubview(popTextField)
        self.view.addSubview(calculateButton)
        self.view.addSubview(sceneStackView)
    }
    
    func setUpStackView() {
        sceneStackView.translatesAutoresizingMaskIntoConstraints = false
        sceneStackView.addArrangedSubview(resultLabel)
        sceneStackView.addArrangedSubview(buyStrikeTextField)
        sceneStackView.addArrangedSubview(sellStrikeTextField)
        sceneStackView.addArrangedSubview(limitPriceTextField)
        sceneStackView.addArrangedSubview(popTextField)
        sceneStackView.addArrangedSubview(calculateButton)
    }
    
    func constrainViews() {
        sceneStackView.anchor(top: self.safeArea.topAnchor, bottom: self.safeArea.bottomAnchor, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, topPadding: 0, bottomPadding: 0, leadingPadding: 0, trailingPadding: 0)
    }
    
    // MARK: - Actions
    
    func activateButton() {
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped(sender:)), for: .touchUpInside)
    }
    
    @objc func calculateButtonTapped(sender: UIButton) {
        guard let buyStrikeText = buyStrikeTextField.text,
            let sellStrikeText = sellStrikeTextField.text,
            let limitPriceText = limitPriceTextField.text,
            let popText = popTextField.text else { return }
        
        guard let buyStrike = Double(buyStrikeText),
            let sellStrike = Double(sellStrikeText),
            let limitPrice = Double(limitPriceText),
            let pop = Double(popText) else { return }
        
        let spreadResult = SpreadResult(buyStrikePrice: buyStrike, sellStrikePrice: sellStrike, limitPrice: limitPrice, pop: pop)
        
        resultLabel.text = "\(spreadResult.approxYtd) % return over long term."
        
    }
    
}
