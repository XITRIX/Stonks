//
//  UILabel+Extensions.swift
//  Finance
//
//  Created by Даниил Виноградов on 03.02.2023.
//

import UIKit

extension UILabel {
    func setText(_ text: String?) {
        self.text = text
        isHidden = text.isNilOrEmpty
    }
}
