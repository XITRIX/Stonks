//
//  Injected.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import Foundation

@propertyWrapper
struct Injected<T> {
    let wrappedValue = Mvvm.shared.container.resolve() as T
}

