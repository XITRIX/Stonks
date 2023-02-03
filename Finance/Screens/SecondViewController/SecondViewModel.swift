//
//  SecondViewModel.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import Foundation
import RxRelay

protocol SecondViewModelProtocol: MvvmViewModelWithProtocol where Model == String {
    var text: BehaviorRelay<Model> { get }
}

class SecondViewModel: MvvmViewModelWith<String>, SecondViewModelProtocol {
    var text = BehaviorRelay<String>(value: "")

    required init() {}

    override func prepare(with model: String) {
        text.accept(model)
    }
}
