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
    let change = BehaviorRelay<String?>(value: "")
    let isPositive = BehaviorRelay<Bool?>(value: nil)
    let chart = BehaviorRelay<ChartData>(value: ChartData(segments: []))

    init(from stock: ApiMarketSummaryModel) {
        let value: Double
        if let last = stock.spark.close?.compactMap({$0}).last {
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

        let dateOffset = stock.gmtOffSetMilliseconds / 1000

        let segments: [ChartSegment] = stock.spark.timestamp?.enumerated().compactMap { item in
            let currentTimezoneOffset = TimeZone.current.secondsFromGMT()
            let date = Date(timeIntervalSince1970: Double(item.element + dateOffset - currentTimezoneOffset))
            let price = stock.spark.close?[item.offset]

            guard let price else { return nil }

            return ChartSegment(date: date, price: price)
        } ?? []

        guard let startRaw = stock.spark.start,
              let endRaw = stock.spark.end
        else {
            self.chart.accept(ChartData(segments: []))
            return
        }

        let start = Date(timeIntervalSince1970: Double(startRaw - dateOffset))
        let end = Date(timeIntervalSince1970: Double(endRaw - dateOffset))

        self.chart.accept(ChartData(segments: segments, closed: stock.regularMarketPreviousClose.raw, start: start, end: end, isPositive: isPositive ?? true, simplefied: true))
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
