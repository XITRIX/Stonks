//
//  StockCell.swift
//  Finance
//
//  Created by Даниил Виноградов on 03.02.2023.
//

import UIKit

class StockCell: UITableViewCell {
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
        value.setText(model.value)
        changes.setText(model.change)
        changesHolder.backgroundColor = color(for: model.isPositive)
    }
}

// MARK: - Private functions
private extension StockCell {
    func color(for positive: Bool?) -> UIColor {
        switch positive {
        case .some(let positive):
            return positive ? .systemGreen : .systemRed
        case .none:
            return .systemGray
        }
    }
}
