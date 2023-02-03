//
//  StockDetailsViewModel.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import Foundation
import RxRelay

protocol StockDetailsViewModelProtocol: MvvmViewModelWithProtocol {
    var text: BehaviorRelay<String?> { get }
}

class StockDetailsViewModel: MvvmViewModelWith<String>, StockDetailsViewModelProtocol {
    let text = BehaviorRelay<String?>(value: "Loading...")

    required init() {
        super.init()
    }

    override func prepare(with model: String) {
        reloadTitle(model)
    }

    // MARK: - Private
    @Injected private var api: FinanceApiProtocol
}

// MARK: - Private functions
extension StockDetailsViewModel {
    private func reloadTitle(_ title: String) {
        Task {
            await apiCall {
                text.accept(try await api.getStockDetails(title).enName)
            }
        }
    }
}
