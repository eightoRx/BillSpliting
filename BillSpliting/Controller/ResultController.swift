//
//  ResultController.swift
//  Climat
//
//  Created by Pavel Kostin on 17.06.2024.
//

import UIKit



final class ResultController: UIViewController {
    
    private let resultView = ResultView()
    
    override func loadView() {
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.delegate = self
    }
    
    func updateLabels(resultText: String, bottomText: String) {
        resultView.updateLabels(resultText: resultText, bottomText: bottomText)
    }
}


extension ResultController: RecalculateButtonDelegate {
    func reculculateButtonAction() {
        self.dismiss(animated: true)
    }
}
