//
//  Converter.swift
//  Finance
//
//  Created by Даниил Виноградов on 05.02.2023.
//

import Foundation

class Converter {
    static func dashIfEmpty(for text: String?) -> String {
        guard let text
        else { return "—" }

        return text.isEmpty ? "—" : text
    }
}
