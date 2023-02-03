//
//  Optional+String.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import Foundation

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        self?.isEmpty ?? true
    }
}
