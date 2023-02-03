//
//  TestViewController.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import UIKit
import RxSwift
import RxCocoa

class TestViewController<VM: TestViewModelProtocol>: MvvmViewController<VM> {
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        bind(in: disposeBag) {
            viewModel.text.bind(to: label.rx.text)
            button.rx.tap.bind(onNext: viewModel.navigationTest )
        }
    }


}

