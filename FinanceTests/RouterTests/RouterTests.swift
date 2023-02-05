//
//  RouterTests.swift
//  FinanceTests
//
//  Created by Даниил Виноградов on 05.02.2023.
//

import XCTest
@testable import Finance

final class RouterTests: XCTestCase {
    var sut: Router!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Router()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testResolve1() throws {
        sut.register(TestViewController<TestViewModel>.self)
        let resolvedObject = sut.resolve(TestViewModel.self)
        XCTAssert(type(of: resolvedObject) == TestViewController<TestViewModel>.self, "Object of a wrong type")
    }

    func testResolve2() throws {
        sut.register(TestViewController<TestViewModelWith<String>>.self)
        let resolvedObject = sut.resolve(TestViewModelWith.self, with: "TEST")
        guard let vc = resolvedObject as? TestViewController<TestViewModelWith<String>>
        else { return XCTFail("Object of a wrong type") }

        XCTAssertEqual(vc.viewModel.model, "TEST")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
