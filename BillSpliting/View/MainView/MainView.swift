//
//  MainView.swift
//  BillSpliting
//
//  Created by Pavel Kostin on 17.06.2024.
//

import UIKit

protocol MainViewTextFieldDelegate: AnyObject {
    func textFieldAction(_ value: Double)
}

final class MainView: UIView {
    
    weak var delegate: MainViewTextFieldDelegate?
    
    private let topLable = UILabel()
    private let textFieald = UITextField()
    let settingsView = SettingsView()
    
    
    override init(frame: CGRect) {
        super .init(frame: .zero)
        setupView()
        setupConstraint()
        setupConfigure()
        textFieald.endEditing(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(topLable)
        addSubview(textFieald)
        addSubview(settingsView)
    }
    
    private func setupConstraint() {
        
        topLable.translatesAutoresizingMaskIntoConstraints = false
        textFieald.translatesAutoresizingMaskIntoConstraints = false
        settingsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topLable.topAnchor.constraint(equalTo: topAnchor, constant: 75),
            topLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            
            
            textFieald.topAnchor.constraint(equalTo: topAnchor, constant: 125),
            textFieald.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textFieald.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            settingsView.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            settingsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            settingsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            settingsView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func setupConfigure() {
        backgroundColor = .white
        
        topLable.text = Resources.Strings.topLabel
        topLable.textColor = Resources.Colors.lightGrey
        topLable.font = .systemFont(ofSize: 25, weight: .semibold)
        
        textFieald.placeholder = Resources.Strings.placeholder
        textFieald.font = .systemFont(ofSize: 30, weight: .semibold)
        textFieald.textColor = Resources.Colors.green
        textFieald.textAlignment = .center
        textFieald.keyboardType = .decimalPad
        textFieald.delegate = self
        
    }
}

extension MainView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text, let value = Double(text) else { return }
        delegate?.textFieldAction(value)
    }
}

