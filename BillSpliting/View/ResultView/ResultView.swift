//
//  ResultView.swift
//  BillSpliting
//
//  Created by Pavel Kostin on 18.06.2024.
//

import UIKit

protocol RecalculateButtonDelegate: AnyObject {
    func reculculateButtonAction()
}

final class ResultView: UIView {
    
    weak var delegate: RecalculateButtonDelegate?
    
    private let bottomView = UIView()
    private let verticalStack = UIStackView()
    private let topLabel = UILabel()
    private let resultLabel = UILabel()
    private let bottomLabel = UILabel()
    private let recalculateButton = UIButton()
    
    override init(frame: CGRect) {
        super .init(frame: .zero)
        setupView()
        setupConstraint()
        setupConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(bottomView)
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(topLabel)
        verticalStack.addArrangedSubview(resultLabel)
        addSubview(bottomLabel)
        addSubview(recalculateButton)
    }
    
    private func setupConstraint() {
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        recalculateButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: topAnchor, constant: 250),
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            verticalStack.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            verticalStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            bottomLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 50),
            bottomLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            bottomLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -30),
            
            recalculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            recalculateButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            recalculateButton.heightAnchor.constraint(equalToConstant: 50),
            recalculateButton.widthAnchor.constraint(equalToConstant: 200)
        ])
   }
    
    private func setupConfigure() {
        backgroundColor = Resources.Colors.lightGreen
        
        bottomView.backgroundColor = Resources.Colors.customWhite
        bottomView.layer.cornerRadius = 20
        
        verticalStack.axis = .vertical
        verticalStack.alignment = .center
        verticalStack.spacing = 20
        
        topLabel.text = Resources.Strings.totalPersonPrice
        topLabel.textColor = Resources.Colors.lightGrey
        topLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        
        resultLabel.textColor = Resources.Colors.green
        resultLabel.font = .systemFont(ofSize: 45, weight: .semibold)
        
bottomLabel.textColor = Resources.Colors.lightGrey
        bottomLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        bottomLabel.numberOfLines = 0
        bottomLabel.textAlignment = .center
        
        recalculateButton.setTitle(Resources.Strings.recalculate, for: .normal)
        recalculateButton.setTitleColor(Resources.Colors.customWhite, for: .normal)
        recalculateButton.backgroundColor = Resources.Colors.green
        recalculateButton.layer.cornerRadius = 7
        recalculateButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        recalculateButton.addTarget(self, action: #selector(recalculateButtonAction), for: .touchUpInside)
    }
    
    func updateLabels(resultText: String, bottomText: String) {
        resultLabel.text = resultText
        bottomLabel.text = bottomText
    }
    
    @objc private func recalculateButtonAction() {
        delegate?.reculculateButtonAction()
    }
}


