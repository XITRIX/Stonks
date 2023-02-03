//
//  StockCellModel.swift
//  Finance
//
//  Created by Даниил Виноградов on 03.02.2023.
//

import Foundation
import RxSwift
import RxRelay

class StockCellModel: Hashable {
    var symbol: String
    var name: String?
    let value = BehaviorRelay<String?>(value: "")
    var change = BehaviorRelay<String?>(value: "")
    var isPositive = BehaviorRelay<Bool?>(value: nil)

    init(from stock: MarketSummaryModel) {
        let value: Double
        if let close = stock.spark.close,
           let last = close.last,
           let last
        {
            value = last
        } else {
            value = stock.regularMarketPreviousClose.raw
        }

        let change: Double = value - stock.regularMarketPreviousClose.raw

        let isPositive: Bool?
        if change > 0 {
            isPositive = true
        } else if change < 0 {
            isPositive = false
        } else {
            isPositive = nil
        }

        let changeText = Formatter.changeFormatter.string(from: NSNumber(value: change)) ?? "None"

        self.symbol = stock.symbol
        self.name = stock.shortName
        self.value.accept(Formatter.currencyFormatter.string(from: NSNumber(value: value)) ?? "None")
        self.change.accept(changeText)
        self.isPositive.accept(isPositive)
    }

    func applyChanges(from model: StockCellModel) {
        value.accept(model.value.value)
        change.accept(model.change.value)
        isPositive.accept(model.isPositive.value)
    }

    static func == (lhs: StockCellModel, rhs: StockCellModel) -> Bool {
        lhs.symbol == rhs.symbol
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(symbol)
    }
}
