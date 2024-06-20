//
//  ViewController.swift
//  Climat
//
//  Created by Pavel Kostin on 27.05.2024.
//

import UIKit

final class MainController: UIViewController {
    
    private let customView = MainView()
    
    private var countPeaple = 0.0
    private var totalPrice = 0.0
    private var percentTip = 0.0
    private let resultController = ResultController()
    private let resultView = ResultView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.settingsView.delegate = self
        customView.delegate = self
    }
    
    private func updateResult() {
        let resultText = String(Float(totalPrice * (percentTip / 100) / countPeaple))
        let bottomText = "Split between \(Int(countPeaple)) peaople, with \(Int(percentTip)) tip"
        resultController.updateLabels(resultText: resultText, bottomText: bottomText)
        present(resultController, animated: true)
    }
}


extension MainController: MainViewTextFieldDelegate {
    
    func textFieldAction(_ value: Double) {
        totalPrice = value
        print(totalPrice)
    }
}

extension MainController: MainViewDelegate {
    
    func stepperAction(sender: UIStepper, label: UILabel) {
        label.text = "\(Int(sender.value))"
        countPeaple = sender.value
        view.endEditing(true)
    }
    
    
    func percentAction(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0: percentTip = 0.0
        case 1: percentTip = 10.0
        case 2: percentTip = 20.0
        default: break
        }
        view.endEditing(true)
    }
    
   func actionCalculateButton() {
        updateResult()
    }
}


