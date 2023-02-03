//
//  StockDetailsViewController.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import UIKit

class StockDetailsViewController<VM: StockDetailsViewModelProtocol>: MvvmViewController<VM> {
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bind(in: disposeBag) {
            label.rx.text <- viewModel.text
        }
    }
}
