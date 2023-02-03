//
//  SecondViewController.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import UIKit
import RxSwift
import RxCocoa

class SecondViewController<VM: SecondViewModelProtocol>: MvvmViewController<VM> {
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        bind(in: disposeBag) {
            viewModel.text.bind(to: label.rx.text)
        }
    }

}
