//
//  Formatters.swift
//  Finance
//
//  Created by Даниил Виноградов on 03.02.2023.
//

import UIKit

class Formatter {
    static var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        return formatter
    }

    static var changeFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.positivePrefix = "+"
        formatter.currencySymbol = ""
        return formatter
    }

    static func stockColor(from change: Double) -> UIColor {
        if change > 0 {
            return .stockGreen
        } else if change < 0 {
            return .stockRed
        } else {
            return .systemGray
        }
    }
}

extension NumberFormatter {
    func format(from double: Double) -> String? {
        string(from: NSNumber(value: double))
    }
}
