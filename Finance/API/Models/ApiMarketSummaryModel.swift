//
//  MarketSummaryModel.swift
//  Finance
//
//  Created by Даниил Виноградов on 03.02.2023.
//

import Foundation

struct ApiFinanceMarketSummaryResponseModel: Codable {
    let marketSummaryAndSparkResponse: ApiFinanceMarketSummaryResultModel?
}

// MARK: - FinanceSummaryResponseModel
struct ApiFinanceMarketSummaryResultModel: Codable {
    let result: [ApiMarketSummaryModel]?
}


// MARK: - FinanceMarketSummaryModel
struct ApiMarketSummaryModel: Codable, Hashable {
    let exchangeTimezoneName, fullExchangeName: String?
    let symbol: String
    let gmtOffSetMilliseconds: Int
    let exchangeDataDelayedBy, firstTradeDateMilliseconds: Int?
    let language: ApiLanguage?
    let regularMarketTime: ApiRegularMarket?
    let exchangeTimezoneShortName, quoteType: String?
    let marketState: ApiMarketState?
    let market: String?
    let spark: ApiSpark
    let priceHint: Int?
    let tradeable: Bool?
    let sourceInterval: Int?
    let exchange, shortName: String?
    let region: ApiRegion?
    let triggerable: Bool?
    let regularMarketPreviousClose: ApiRegularMarket
}

// MARK: - Language
enum ApiLanguage: String, Codable, Hashable {
    case enUS = "en-US"
}

// MARK: - MarketState
enum ApiMarketState: String, Codable, Hashable {
    case pre = "PRE"
    case prepre = "PREPRE"
    case post = "POST"
    case postpost = "POSTPOST"
    case regular = "REGULAR"
    case closed = "CLOSED"
}

// MARK: - Region
enum ApiRegion: String, Codable, Hashable {
    case us = "US"
}

// MARK: - RegularMarket
struct ApiRegularMarket: Codable, Hashable {
    let raw: Double
    let fmt: String
}

// MARK: - Spark
struct ApiSpark: Codable, Hashable {
    let previousClose, chartPreviousClose: Double?
    let symbol: String?
    let timestamp: [Int]?
    let close: [Double?]?
    let dataGranularity: Int?
    let end, start: Int?
}
