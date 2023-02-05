//
//  FinanceApi.swift
//  Finance
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import Foundation

struct ApiError: Error {
    let message: String
    var localizedDescription: String { message }
}

enum ChartInterval: String {
    case minute = "1m"
    case twoMinutes = "2m"
    case fiveMinutes = "5m"
    case fifteenMinutes = "15m"
    case thirtyMinutes = "30m"
    case hour = "1h"
    case day = "1d"
    case week = "1wk"
    case month = "1mo"
}

enum ChartRange: String {
    case day = "1d"
    case fiveDays = "5d"
    case month = "1m"
}

protocol FinanceApiProtocol {
    func getStocks() async throws -> [MarketSummaryModel]
    func getStockDetails(_ symbol: String) async throws -> StockSummaryModel
    func getStockChart(_ symbol: String, interval: ChartInterval, range: ChartRange) async throws -> ChartModel
}

class FinanceApi: FinanceApiProtocol {
    private static let host = "yh-finance.p.rapidapi.com"
    private static let apiKey = "ed039224e4mshf93dece37b683d7p144c69jsne0fa17366d3e"

    func getStocks() async throws -> [MarketSummaryModel] {
        var components = urlBaseComponents
        components.path = "/market/v2/get-summary"
        components.queryItems = [
            URLQueryItem(name: "region", value: "US")
        ]

        guard let endpoint = components.url
        else { throw ApiError(message: "Incorrect URL") }

        let response = try await baseRequest(from: endpoint) as FinanceMarketSummaryResponseModel
        return response.marketSummaryAndSparkResponse?.result ?? []
    }

    func getStockDetails(_ symbol: String) async throws -> StockSummaryModel {
        var components = urlBaseComponents
        components.path = "/stock/v2/get-summary"
        components.queryItems = [
            URLQueryItem(name: "symbol", value: symbol),
            URLQueryItem(name: "region", value: "US")
        ]

        guard let endpoint = components.url
        else { throw ApiError(message: "Incorrect URL") }

        return try await baseRequest(from: endpoint) as StockSummaryModel
    }

    func getStockChart(_ symbol: String, interval: ChartInterval, range: ChartRange) async throws -> ChartModel {
        var components = urlBaseComponents
        components.path = "/stock/v3/get-chart"
        components.queryItems = [
            URLQueryItem(name: "symbol", value: symbol),
            URLQueryItem(name: "interval", value: interval.rawValue),
            URLQueryItem(name: "range", value: range.rawValue),
            URLQueryItem(name: "region", value: "US")
        ]

        guard let endpoint = components.url
        else { throw ApiError(message: "Incorrect URL") }

        let response = try await baseRequest(from: endpoint) as ChartModelResponse
        guard let result = response.chart.result.first
        else { throw ApiError(message: "Error while parsing ChartModel") }

        return result
    }

    // MARK: - Private
    private func baseRequest<T: Decodable>(from url: URL) async throws -> T {
        var request = URLRequest(url: url)
        print(url)
        request.allHTTPHeaderFields = headers
        let data = try await URLSession.shared.data(for: request).0
        return try JSONDecoder().decode(T.self, from: data)
    }

    private let urlBaseComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        return components
    }()

    private let headers = [
        "X-RapidAPI-Key": apiKey,
        "X-RapidAPI-Host": host
    ]
}
