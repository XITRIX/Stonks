//
//  MarketSummaryModel.swift
//  Finance
//
//  Created by Даниил Виноградов on 03.02.2023.
//

import Foundation

// MARK: - MarketSummaryModel
struct FinanceMarketSummaryModel: Codable, Hashable {
    let exchangeTimezoneName, fullExchangeName: String?
    let symbol: String
    let gmtOffSetMilliseconds, exchangeDataDelayedBy, firstTradeDateMilliseconds: Int?
    let language: Language?
    let regularMarketTime: RegularMarket?
    let exchangeTimezoneShortName, quoteType: String?
    let marketState: MarketState?
    let market: String?
    let spark: Spark
    let priceHint: Int?
    let tradeable: Bool?
    let sourceInterval: Int?
    let exchange, shortName: String?
    let region: Region?
    let triggerable: Bool?
    let regularMarketPreviousClose: RegularMarket
}

enum Language: String, Codable, Hashable {
    case enUS = "en-US"
}

enum MarketState: String, Codable, Hashable {
    case pre = "PRE"
    case prepre = "PREPRE"
    case post = "POST"
    case postpost = "POSTPOST"
    case regular = "REGULAR"
}

enum Region: String, Codable, Hashable {
    case us = "US"
}

// MARK: - RegularMarket
struct RegularMarket: Codable, Hashable {
    let raw: Double
    let fmt: String
}

// MARK: - Spark
struct Spark: Codable, Hashable {
    let previousClose, chartPreviousClose: Double?
    let symbol: String?
    let timestamp: [Int]?
    let close: [Double]?
    let dataGranularity, end, start: Int?
}
