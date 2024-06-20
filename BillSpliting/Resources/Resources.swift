//
//  Resources.swift
//  BillSpliting
//
//  Created by Pavel Kostin on 17.06.2024.
//

import UIKit


enum Resources {
    
    enum Strings {
        static let topLabel = "Enter bill total"
        static let placeholder = "e.g. 123.45"
        static let selectTip = "Select tip"
        static let chooseSplit = "Choose split"
        static var countPerson = "0"
        static let calculate = "Calculate"
        static let recalculate = "Recalculate"
        static let totalPersonPrice = "Total per person"
        static var total = "0"
        static var bottomLabel = "Split between 3 peaople, with 0% tip"
    }
    
    enum Colors {
        static let green = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
        static let lightGreen = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        static let customWhite = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        static let lightGrey = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    enum Fonts {
        static let customFont = UIFont.systemFont(ofSize: 25, weight: .semibold)
    }
}
