//
//  StocksViewModel.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import Foundation
import RxRelay
import RxSwift

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
    let allStocks = BehaviorRelay<[StockCellModel]>(value: [])
    let searchHint = BehaviorRelay<String?>(value: "Search for stonks")
    let searchQuery = BehaviorRelay<String?>(value: nil)
    let isLoading = BehaviorRelay<Bool>(value: true)

    var stocks: Observable<[StockCellModel]> {
        Observable.combineLatest(allStocks, searchQuery).map(filterStocks)
    }

    // MARK: - Init
    required init() {
        super.init()
        title.accept("Stonks!")
        // Disable to not spend API calls.
        timer = makeTimer()
        Task {
            await refreshStocks()
            isLoading.accept(false)
        }
    }

    // MARK: - Public
    func selectStock(_ stock: StockCellModel) {
        navigate(to: StockDetailsViewModel.self, with: stock, by: .detail)
    }

    func refreshStocks() async {
        await apiCall {
            let stocks = try await api.getStocks()
            await updateStocks(with: stocks.map(StockCellModel.init(from:)))
        }
    }

    func updateStocks(with stocks: [StockCellModel]) async {
        var temp = [StockCellModel]()
        for stock in stocks {
            if let res = allStocks.value.get({ $0.symbol == stock.symbol }) {
                res.applyChanges(from: stock)
                temp.append(res)
            } else {
                temp.append(stock)
            }
        }
        allStocks.accept(temp)
    }

    // MARK: - Private
    @Injected private var api: FinanceApiProtocol
    private var timer: Timer!
    private let refrashRate: Double = 8
}

// MARK: - Private functions
private extension StocksViewModel {
    func filterStocks(_ stocks: [StockCellModel], filter: String?) -> [StockCellModel] {
        guard let filter,
              !filter.isEmpty
        else { return stocks }

        return stocks
            .filter {
                $0.name?.localizedCaseInsensitiveContains(filter) ?? false ||
                    $0.symbol.localizedCaseInsensitiveContains(filter)
            }
    }

    func makeTimer() -> Timer {
        .scheduledTimer(withTimeInterval: refrashRate, repeats: true) { [weak self] _ in
            guard let self else { return }
            Task { await self.refreshStocks() }
        }
    }
}
