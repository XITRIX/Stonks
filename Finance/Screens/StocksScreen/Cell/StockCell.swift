//
//  StockCell.swift
//  Finance
//
//  Created by Даниил Виноградов on 03.02.2023.
//

import UIKit

class StockCell: MvvmTableViewCell {
    // MARK: - IBOutlets
    @IBOutlet private var symbol: UILabel!
    @IBOutlet private var name: UILabel!
    @IBOutlet private var value: UILabel!
    @IBOutlet private var changes: UILabel!
    @IBOutlet private var changesHolder: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        changesHolder.layer.cornerCurve = .continuous
        changesHolder.layer.cornerRadius = 4
    }

    // MARK: - Public
    func setup(with model: StockCellModel) {
        symbol.setText(model.symbol)
        name.setText(model.name)

        bind(in: disposeBag) {
            value.rx.textWithVisibility <- model.value
            changes.rx.textWithVisibility <- model.change
            changesHolder.rx.backgroundColor <- model.isPositive.map(color(for:))
        }
    }
}

// MARK: - Private functions
private extension StockCell {
    func color(for positive: Bool?) -> UIColor? {
        switch positive {
        case .some(let positive):
            return positive ? .stockGreen : .stockRed
        case .none:
            return .systemGray
        }
    }
}
