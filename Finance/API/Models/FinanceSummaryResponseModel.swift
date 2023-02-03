//
//  FinanceSummaryResponseModel.swift
//  Finance
//
//  Created by Даниил Виноградов on 03.02.2023.
//

import Foundation

struct FinanceMarketSummaryResponseModel: Codable {
    let marketSummaryAndSparkResponse: FinanceMarketSummaryResultModel?
}

// MARK: - FinanceSummaryResponseModel
struct FinanceMarketSummaryResultModel: Codable {
    let result: [FinanceMarketSummaryModel]?
}
