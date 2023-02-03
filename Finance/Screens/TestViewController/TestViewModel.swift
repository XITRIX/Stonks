//
//  TestViewModel.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import Foundation
import RxSwift
import RxRelay

protocol TestViewModelProtocol: MvvmViewModelProtocol {
    var text: BehaviorRelay<String> { get }
    func navigationTest()
}

class TestViewModel: MvvmViewModel, TestViewModelProtocol {
    var counter: Int = 0
    let text = BehaviorRelay<String>(value: "Hello world")
    required init() {}

    func navigationTest() {
        counter += 1
        navigate(to: SecondViewModel.self, with: "Details screen: \(counter)", by: .detail)
    }
}
