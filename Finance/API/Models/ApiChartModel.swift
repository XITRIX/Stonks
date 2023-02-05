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
struct ApiChartModelResponse: Codable, Hashable {
    let chart: ApiChartModelChart
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ChartModelChart
struct ApiChartModelChart: Codable, Hashable {
    let result: [ApiChartModel]
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ChartModel
struct ApiChartModel: Codable, Hashable {
    let meta: ApiChartModelMeta
    let timestamp: [Int]?
    let indicators: ApiChartModelIndicators
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ChartModelIndicators
struct ApiChartModelIndicators: Codable, Hashable {
    let quote: [ApiChartModelQuote]
    let adjclose: [ApiChartModelAdjclose]?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ChartModelAdjclose
struct ApiChartModelAdjclose: Codable, Hashable {
    let adjclose: [Double]?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ChartModelQuote
struct ApiChartModelQuote: Codable, Hashable {
    let volume: [Int?]?
    let quoteOpen, close, low, high: [Double?]?

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
struct ApiChartModelMeta: Codable, Hashable {
    let currency, symbol, exchangeName, instrumentType: String?
    let firstTradeDate, regularMarketTime, gmtoffset: Int?
    let timezone, exchangeTimezoneName: String?
    let regularMarketPrice, chartPreviousClose: Double?
    let priceHint: Int?
    let currentTradingPeriod: ApiChartModelCurrentTradingPeriod?
    let dataGranularity, range: String?
    let validRanges: [String]?
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ChartModelCurrentTradingPeriod
struct ApiChartModelCurrentTradingPeriod: Codable, Hashable {
    let pre, regular, post: ApiChartModelPost
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ChartModelPost
struct ApiChartModelPost: Codable, Hashable {
    let timezone: String
    let end, start, gmtoffset: Int
}
