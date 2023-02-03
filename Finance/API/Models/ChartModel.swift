// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let chartModelWelcome = try? JSONDecoder().decode(ChartModelWelcome.self, from: jsonData)

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - ChartModelResponse
struct ChartModelResponse: Codable, Hashable {
    let chart: ChartModelChart
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ChartModelChart
struct ChartModelChart: Codable, Hashable {
    let result: [ChartModel]
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ChartModel
struct ChartModel: Codable, Hashable {
    let meta: ChartModelMeta
    let timestamp: [Int]
    let indicators: ChartModelIndicators
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ChartModelIndicators
struct ChartModelIndicators: Codable, Hashable {
    let quote: [ChartModelQuote]
    let adjclose: [ChartModelAdjclose]?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ChartModelAdjclose
struct ChartModelAdjclose: Codable, Hashable {
    let adjclose: [Double]?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ChartModelQuote
struct ChartModelQuote: Codable, Hashable {
    let volume: [Int]
    let quoteOpen, close, low, high: [Double]

    enum CodingKeys: String, CodingKey {
        case volume
        case quoteOpen = "open"
        case close, low, high
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ChartModelMeta
struct ChartModelMeta: Codable, Hashable {
    let currency, symbol, exchangeName, instrumentType: String?
    let firstTradeDate, regularMarketTime, gmtoffset: Int?
    let timezone, exchangeTimezoneName: String?
    let regularMarketPrice, chartPreviousClose: Double?
    let priceHint: Int?
    let currentTradingPeriod: ChartModelCurrentTradingPeriod?
    let dataGranularity, range: String?
    let validRanges: [String]?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ChartModelCurrentTradingPeriod
struct ChartModelCurrentTradingPeriod: Codable, Hashable {
    let pre, regular, post: ChartModelPost?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ChartModelPost
struct ChartModelPost: Codable, Hashable {
    let timezone: String?
    let end, start, gmtoffset: Int?
}
