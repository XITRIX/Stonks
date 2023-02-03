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

protocol FinanceApiProtocol {
    func getStocks() async throws -> [FinanceMarketSummaryModel]
    func getStockDetails(_ stock: String) async throws -> MangaModel
}

class FinanceApi: FinanceApiProtocol {
    private static let host = "yh-finance.p.rapidapi.com"
    private static let apiKey = "ec3609b91emshae921bbc67c401ap17de25jsnd4f5d968d54d"

    func getStocks() async throws -> [FinanceMarketSummaryModel] {
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

    func getStockDetails(_ stock: String) async throws -> MangaModel {
        throw ApiError(message: "")
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
