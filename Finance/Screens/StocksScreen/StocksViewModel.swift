//
//  StocksViewModel.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import Foundation
import RxRelay
import RxSwift

struct StockCellModel: Hashable {
    var symbol: String
    var name: String?
    var value: String
    var change: String
    var isPositive: Bool?
}

protocol StocksViewModelProtocol: MvvmViewModelProtocol {
    var stocks: Observable<[StockCellModel]> { get }
    var searchHint: BehaviorRelay<String?> { get }
    var searchQuery: BehaviorRelay<String?> { get }
    var isLoading: BehaviorRelay<Bool> { get }

    func selectStock(_ stock: StockCellModel)
    func refreshStocks() async
}

class StocksViewModel: MvvmViewModel, StocksViewModelProtocol {
    // MARK: - Public
    let allStocks = BehaviorRelay<[FinanceMarketSummaryModel]>(value: [])
    let searchHint = BehaviorRelay<String?>(value: "Search for stonks")
    let searchQuery = BehaviorRelay<String?>(value: nil)
    let isLoading = BehaviorRelay<Bool>(value: true)

    var stocks: Observable<[StockCellModel]> {
        Observable.combineLatest(allStocks, searchQuery).map { allStocks, searchQuery in
            guard let searchQuery,
                  !searchQuery.isEmpty
            else { return allStocks.map { $0.cellModel }}

            return allStocks
                .filter { $0.shortName?.localizedCaseInsensitiveContains(searchQuery) ?? false }
                .map { $0.cellModel }
        }
    }

    // MARK: - Init
    required init() {
        super.init()
        title.accept("Stonks!")
        Task {
            await refreshStocks()
            isLoading.accept(false)
        }
    }

    // MARK: - Public
    func selectStock(_ stock: StockCellModel) {
        navigate(to: StockDetailsViewModel.self, with: stock.symbol, by: .detail)
    }

    func refreshStocks() async {
        await apiCall {
            allStocks.accept(try await api.getStocks())
        }
    }

    // MARK: - Private
    @Injected private var api: FinanceApiProtocol
}

private extension StocksViewModel {
    func filterStocks(_ stocks: [FinanceMarketSummaryModel], filter: String?) -> [StockCellModel] {
        guard let filter,
              !filter.isEmpty
        else { return stocks.map { $0.cellModel }}

        return stocks
            .filter {
                $0.shortName?.localizedCaseInsensitiveContains(filter) ?? false ||
                $0.symbol.localizedCaseInsensitiveContains(filter)
            }
            .map { $0.cellModel }
    }
}

private extension FinanceMarketSummaryModel {
    var cellModel: StockCellModel {
        let value: Double =
            self.spark.close?.last ??
            self.regularMarketPreviousClose.raw

        let change: Double = self.regularMarketPreviousClose.raw - value

        let isPositive: Bool?
        if change > 0 {
            isPositive = true
        } else if change < 0 {
            isPositive = false
        } else {
            isPositive = nil
        }

        let changeText = self.changeFormatter.string(from: NSNumber(value: change)) ?? "None"

        return .init(symbol: self.symbol,
                     name: self.shortName,
                     value: self.formatter.string(from: NSNumber(value: value)) ?? "None",
                     change: changeText,
                     isPositive: isPositive)
    }

    private var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        return formatter
    }

    private var changeFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.positivePrefix = "+"
        formatter.currencySymbol = ""
        return formatter
    }
}

extension MvvmViewModel {
    func apiCall<T>(fun: () async throws -> T) async -> T? {
        do {
            return try await fun()
        } catch {
            print(error)
            return nil
        }
    }
}
