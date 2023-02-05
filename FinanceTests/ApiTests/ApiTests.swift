//
//  ApiTests.swift
//  FinanceTests
//
//  Created by Даниил Виноградов on 05.02.2023.
//

import XCTest
@testable import Finance

class ApiTests: XCTestCase {
    var sut: FinanceApiProtocol!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = FinanceApi()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testMarketSummary() async throws {
        _ = try await sut.getStocks()
    }

    func testStockDetails() async throws {
        _ = try await sut.getStockDetails("AAPL")
    }

    func testStockChart() async throws {
        _ = try await sut.getStockChart("AAPL", interval: .twoMinutes, range: .day)
    }
}
