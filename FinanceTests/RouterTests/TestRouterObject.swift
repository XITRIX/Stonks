//
//  TestRouterObject.swift
//  FinanceTests
//
//  Created by Даниил Виноградов on 05.02.2023.
//

import UIKit
@testable import Finance

protocol TestViewModelProtocol: MvvmViewModelProtocol {}
class TestViewModel: MvvmViewModel, TestViewModelProtocol {}
class TestViewModelWith<Model>: MvvmViewModelWith<Model>, TestViewModelProtocol {
    var model: Model!
    override func prepare(with model: Model) {
        self.model = model
    }
}

class TestViewController<VM: TestViewModelProtocol>: MvvmViewController<VM> {}
