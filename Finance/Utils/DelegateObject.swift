//
//  DelegateObject.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import Foundation

class DelegateObject<Parent: AnyObject>: NSObject {
    private(set) weak var parent: Parent!

    init(parent: Parent) {
        self.parent = parent
    }
}
