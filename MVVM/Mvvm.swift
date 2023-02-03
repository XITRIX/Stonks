//
//  Mvvm.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import UIKit

class Mvvm {
    public static var shared = Mvvm()

    public let container = Container()
    public let router = Router()

    private init() {}
}
