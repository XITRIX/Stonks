//
//  StockDetailsViewModel.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import Foundation
import RxRelay

protocol StockDetailsViewModelProtocol: MvvmViewModelWithProtocol {
    var symbol: BehaviorRelay<String?> { get }
    var name: BehaviorRelay<String?> { get }
    var currency: BehaviorRelay<String?> { get }
    var summary: BehaviorRelay<String?> { get }
    var change: BehaviorRelay<Double> { get }

    var onOpen: BehaviorRelay<String?> { get }
    var high: BehaviorRelay<String?> { get }
    var low: BehaviorRelay<String?> { get }
    var volume: BehaviorRelay<String?> { get }
    var pe: BehaviorRelay<String?> { get }
    var marketCap: BehaviorRelay<String?> { get }
    var w25H: BehaviorRelay<String?> { get }
    var w25L: BehaviorRelay<String?> { get }
    var averageVolume: BehaviorRelay<String?> { get }
    var yield: BehaviorRelay<String?> { get }
    var beta: BehaviorRelay<String?> { get }
    var eps: BehaviorRelay<String?> { get }

    var chart: BehaviorRelay<ChartData> { get }
}

class StockDetailsViewModel: MvvmViewModelWith<StockCellModel>, StockDetailsViewModelProtocol {
    let symbol = BehaviorRelay<String?>(value: "Loading...")
    let name = BehaviorRelay<String?>(value: "")
    let currency = BehaviorRelay<String?>(value: "")
    let summary = BehaviorRelay<String?>(value: "")
    let change = BehaviorRelay<Double>(value: 0)

    let onOpen = BehaviorRelay<String?>(value: "")
    let high = BehaviorRelay<String?>(value: "")
    let low = BehaviorRelay<String?>(value: "")
    let volume = BehaviorRelay<String?>(value: "")
    let pe = BehaviorRelay<String?>(value: "")
    let marketCap = BehaviorRelay<String?>(value: "")
    let w25H = BehaviorRelay<String?>(value: "")
    let w25L = BehaviorRelay<String?>(value: "")
    let averageVolume = BehaviorRelay<String?>(value: "")
    let yield = BehaviorRelay<String?>(value: "")
    let beta = BehaviorRelay<String?>(value: "")
    let eps = BehaviorRelay<String?>(value: "")

    let chart = BehaviorRelay<ChartData>(value: ChartData(segments: []))

    required init() {
        super.init()
    }

    override func prepare(with model: StockCellModel) {
        name.accept(model.name)
        reloadTitle(model.symbol)
    }

    // MARK: - Private
    @Injected private var api: FinanceApiProtocol
}

// MARK: - Private functions
extension StockDetailsViewModel {
    private func reloadTitle(_ symbol: String) {
        Task {
            await apiCall {
                applyDetails(try await api.getStockDetails(symbol))
                applyChart(try await api.getStockChart(symbol, interval: .twoMinutes, range: .day))
            }
        }
    }

    func applyDetails(_ details: StockSummaryModel) {
        symbol.accept(details.symbol)
        name.accept(details.quoteType.longName ?? details.quoteType.shortName)
        currency.accept("\(details.quoteType.exchange)・\(details.summaryDetail.currency)")
        summary.accept(details.price?.regularMarketPrice?.fmt)
        change.accept(details.price?.regularMarketChange?.raw ?? 0)

        onOpen.accept(details.summaryDetail.regularMarketOpen?.raw?.currency)
        high.accept(details.summaryDetail.regularMarketDayHigh?.raw?.currency)
        low.accept(details.summaryDetail.regularMarketDayLow?.raw?.currency)
        volume.accept(details.summaryDetail.volume?.fmt)
        pe.accept(details.summaryDetail.trailingPE?.raw?.currency)
        marketCap.accept(details.summaryDetail.marketCap?.fmt)
        w25H.accept(details.summaryDetail.fiftyTwoWeekHigh?.raw?.currency)
        w25L.accept(details.summaryDetail.fiftyTwoWeekLow?.raw?.currency)
        averageVolume.accept(details.summaryDetail.averageVolume?.fmt)
        yield.accept(details.summaryDetail.dividendYield?.fmt)
        beta.accept(details.summaryDetail.beta?.raw?.currency)
        eps.accept(details.defaultKeyStatistics?.trailingEps?.raw?.currency)
    }

    func applyChart(_ chart: ChartModel) {
        guard let quite = chart.indicators.quote.first
        else { return }

        let segments: [ChartSegment] = chart.timestamp.enumerated().map { item in
            let date = Date(timeIntervalSince1970: Double(item.element))
            let price = quite.high[item.offset]
            return ChartSegment(date: date, price: price)
        }

        self.chart.accept(ChartData(segments: segments, start: chart.meta.chartPreviousClose))
    }
}

struct ChartData {
    var segments: [ChartSegment]
    var start: Double?
}

struct ChartSegment: Identifiable {
    let id = UUID()
    var date: Date
    var price: Double
}

private extension Double {
    var currency: String? {
        Formatter.currencyFormatter.format(from: self)
    }
}
