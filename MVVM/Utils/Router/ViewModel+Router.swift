//
//  ViewModel+Router.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import UIKit

extension MvvmViewModelProtocol {
    public static func resolveVC() -> UIViewController {
        Mvvm.shared.router.resolve(Self.self)
    }
}

extension MvvmViewModelWithProtocol {
    public static func resolveVC(with model: Model) -> UIViewController {
        Mvvm.shared.router.resolve(Self.self, with: model)
    }
}
