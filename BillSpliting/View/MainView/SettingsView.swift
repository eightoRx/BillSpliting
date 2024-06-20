//
//  SettingsView.swift
//  BillSpliting
//
//  Created by Pavel Kostin on 17.06.2024.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func actionCalculateButton()
    func stepperAction(sender: UIStepper, label: UILabel)
    func percentAction(sender: UISegmentedControl)
}

final class SettingsView: UIView {
    
    weak var delegate: MainViewDelegate?
    
    private let topStackView = UIStackView()
    private let tipLabel = UILabel()
    private let splitLabel = UILabel()
    private let segmentedTitles = ["0%", "10%", "20%"]
    private var discountSegmentedControl: UISegmentedControl
    private let horizontalStackView = UIStackView()
    private var count = UILabel()
    private let countButton = UIStepper()
    
    private let calculateButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        self.discountSegmentedControl = UISegmentedControl(items: segmentedTitles)
        
        super .init(frame: .zero)
        setupView()
        setupConstraint()
        setupConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(topStackView)
        topStackView.addArrangedSubview(tipLabel)
        topStackView.addArrangedSubview(discountSegmentedControl)
        topStackView.addArrangedSubview(splitLabel)
        addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(count)
        horizontalStackView.addArrangedSubview(countButton)
        addSubview(calculateButton)
    }
    
    private func setupConstraint() {
        
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        discountSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            discountSegmentedControl.heightAnchor.constraint(equalToConstant: 50),
            discountSegmentedControl.widthAnchor.constraint(equalTo: topStackView.widthAnchor),
            
            horizontalStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 40),
            horizontalStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            calculateButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            calculateButton.heightAnchor.constraint(equalTo: discountSegmentedControl.heightAnchor),
            calculateButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupConfigure() {
        backgroundColor = Resources.Colors.lightGreen
        layer.cornerRadius = 20
        
        topStackView.axis = .vertical
        topStackView.spacing = 30
        topStackView.alignment = .leading
        
        tipLabel.text = Resources.Strings.selectTip
        tipLabel.textColor = Resources.Colors.lightGrey
        tipLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        
        discountSegmentedControl.selectedSegmentTintColor = Resources.Colors.green
        discountSegmentedControl.selectedSegmentIndex = 0
        discountSegmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: Resources.Colors.customWhite],
                                                        for: .selected)
        
        discountSegmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.font: Resources.Fonts.customFont,
            NSAttributedString.Key.foregroundColor: Resources.Colors.green],
                                                        for: .normal)
        discountSegmentedControl.addTarget(self, action: #selector(percentAction(sender:)), for: .valueChanged)
        
        splitLabel.text = Resources.Strings.chooseSplit
        splitLabel.textColor = Resources.Colors.lightGrey
        splitLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        
        horizontalStackView.spacing = 50
        
        countButton.minimumValue = 0
        countButton.maximumValue = 30
        countButton.value = 1
        countButton.addTarget(self, action: #selector(stepperAction(sender: label:)), for: .valueChanged)
        
        count.text = String(Int(countButton.value))
        count.textColor = Resources.Colors.green
        count.font = .systemFont(ofSize: 30, weight: .semibold)
        
        calculateButton.setTitle(Resources.Strings.calculate, for: .normal)
        calculateButton.setTitleColor(Resources.Colors.customWhite, for: .normal)
        calculateButton.backgroundColor = Resources.Colors.green
        calculateButton.layer.cornerRadius = 7
        calculateButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        calculateButton.addTarget(self, action: #selector(actionCalculateButtons), for: .touchUpInside)
    }
    
    @objc private func actionCalculateButtons() {
        delegate?.actionCalculateButton()
    }
    
    @objc private func stepperAction(sender: UIStepper, label: UILabel) {
        delegate?.stepperAction(sender: sender, label: count)
    }
    
    @objc private func percentAction(sender: UISegmentedControl) {
        delegate?.percentAction(sender: sender)
    }
}

