//
//  Array+Extensions.swift
//  Finance
//
//  Created by Даниил Виноградов on 03.02.2023.
//

import Foundation

extension Array {
    func get(_ where: (Element) -> Bool) -> Element? {
        for element in self {
            if `where`(element) {
                return element
            }
        }
        return nil
    }
}
