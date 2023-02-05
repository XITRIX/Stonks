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
    var w52H: BehaviorRelay<String?> { get }
    var w52L: BehaviorRelay<String?> { get }
    var averageVolume: BehaviorRelay<String?> { get }
    var yield: BehaviorRelay<String?> { get }
    var beta: BehaviorRelay<String?> { get }
    var eps: BehaviorRelay<String?> { get }

    var chart: BehaviorRelay<ChartData> { get }
    var chartIsLoading: BehaviorRelay<Bool> { get }
    var chartErrorOccured: BehaviorRelay<Bool> { get }
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
    let w52H = BehaviorRelay<String?>(value: "")
    let w52L = BehaviorRelay<String?>(value: "")
    let averageVolume = BehaviorRelay<String?>(value: "")
    let yield = BehaviorRelay<String?>(value: "")
    let beta = BehaviorRelay<String?>(value: "")
    let eps = BehaviorRelay<String?>(value: "")

    let chart = BehaviorRelay<ChartData>(value: ChartData(segments: []))
    let chartIsLoading = BehaviorRelay<Bool>(value: true)
    let chartErrorOccured = BehaviorRelay<Bool>(value: false)

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
            chartIsLoading.accept(true)

            await apiCall {
                applyDetails(try await api.getStockDetails(symbol))
                applyChart(try await api.getStockChart(symbol, interval: .twoMinutes, range: .day))
                chartIsLoading.accept(false)
            }
        }
    }

    func applyDetails(_ details: ApiStockSummaryModel) {
        symbol.accept(details.symbol)
        name.accept(details.quoteType?.longName ?? details.quoteType?.shortName)
        currency.accept("\(details.quoteType?.exchange ?? "")・\(details.summaryDetail.currency)")
        summary.accept(details.price?.regularMarketPrice?.fmt)
        change.accept(details.price?.regularMarketChange?.raw ?? 0)

        onOpen.accept(details.summaryDetail.regularMarketOpen?.raw?.currency)
        high.accept(details.summaryDetail.regularMarketDayHigh?.raw?.currency)
        low.accept(details.summaryDetail.regularMarketDayLow?.raw?.currency)
        volume.accept(details.summaryDetail.volume?.fmt)
        pe.accept(details.summaryDetail.trailingPE?.raw?.currency)
        marketCap.accept(details.summaryDetail.marketCap?.fmt)
        w52H.accept(details.summaryDetail.fiftyTwoWeekHigh?.raw?.currency)
        w52L.accept(details.summaryDetail.fiftyTwoWeekLow?.raw?.currency)
        averageVolume.accept(details.summaryDetail.averageVolume?.fmt)
        yield.accept(details.summaryDetail.dividendYield?.fmt)
        beta.accept(details.summaryDetail.beta?.raw?.currency)
        eps.accept(details.defaultKeyStatistics?.trailingEps?.raw?.currency)
    }

    func applyChart(_ chart: ApiChartModel) {
        guard let quite = chart.indicators.quote.first
        else { return }

        guard let traidingPeriod = chart.meta.currentTradingPeriod
        else { return }

        let dateOffset = traidingPeriod.regular.gmtoffset

        guard let timestamps = chart.timestamp
        else { return chartErrorOccured.accept(true) }

        let segments: [ChartSegment] = timestamps.enumerated().compactMap { item in
            let currentTimezoneOffset = TimeZone.current.secondsFromGMT()
            let date = Date(timeIntervalSince1970: Double(item.element + dateOffset - currentTimezoneOffset))
            let price = quite.close?[item.offset]

            guard let price else { return nil }

            return ChartSegment(date: date, price: price)
        }

        let start = Date(timeIntervalSince1970: Double(traidingPeriod.regular.start - dateOffset))
        let end = Date(timeIntervalSince1970: Double(traidingPeriod.regular.end - dateOffset))

        self.chart.accept(ChartData(segments: segments, closed: chart.meta.chartPreviousClose, start: start, end: end, isPositive: change.value >= 0))
    }
}

private extension Double {
    var currency: String? {
        Formatter.currencyFormatter.format(from: self)
    }
}
