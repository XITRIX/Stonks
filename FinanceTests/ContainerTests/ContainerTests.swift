//
//  FinanceTests.swift
//  FinanceTests
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import XCTest
@testable import Finance

final class ContainerTests: XCTestCase {
    var sut: Container!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Container()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testContainer1() throws {
        sut.register { TestObject() as TestObjectProtocol }

        let resolvedObject1: TestObjectProtocol = sut.resolve()
        let resolvedObject2: TestObjectProtocol = sut.resolve()

        XCTAssert(resolvedObject1 !== resolvedObject2, "Objects are the same")
        XCTAssertEqual(resolvedObject1.testText, "TEST")
        XCTAssertEqual(resolvedObject2.testText, "TEST")
    }

    func testContainer2() throws {
        sut.register { TestStruct() }

        let resolvedObject1: TestStruct = sut.resolve()
        let resolvedObject2: TestStruct = sut.resolve()

        XCTAssert(resolvedObject1 != resolvedObject2, "Structs are the same")
        XCTAssertEqual(resolvedObject1.testText, "TEST")
        XCTAssertEqual(resolvedObject2.testText, "TEST")
    }

    func testContainerSafeResolve() throws {
        let resolvedObject: TestObjectProtocol? = sut.safeResolve()
        XCTAssert(resolvedObject == nil, "Object should be empty")

        sut.register { TestObject() as TestObjectProtocol }

        let resolvedObject1: TestObjectProtocol? = sut.safeResolve()
        let resolvedObject2: TestObjectProtocol? = sut.safeResolve()

        XCTAssert(resolvedObject1 !== resolvedObject2, "Structs are the same")
        XCTAssertEqual(resolvedObject1?.testText, "TEST")
        XCTAssertEqual(resolvedObject2?.testText, "TEST")
    }

    func testContainerSingleton1() throws {
        let object: TestObjectProtocol = TestObject()
        sut.register { object }

        let resolvedObject1: TestObjectProtocol = sut.resolve()
        let resolvedObject2: TestObjectProtocol = sut.resolve()

        XCTAssert(resolvedObject1 === resolvedObject2, "Objects are not the same")
        XCTAssertEqual(resolvedObject1.testText, "TEST")
        XCTAssertEqual(resolvedObject2.testText, "TEST")
    }

    func testContainerSingleton2() throws {
        sut.registerSingleton { TestObject() as TestObjectProtocol }

        let resolvedObject1: TestObjectProtocol = sut.resolve()
        let resolvedObject2: TestObjectProtocol = sut.resolve()

        XCTAssert(resolvedObject1 === resolvedObject2, "Objects are not the same")
        XCTAssertEqual(resolvedObject1.testText, "TEST")
        XCTAssertEqual(resolvedObject2.testText, "TEST")
    }

    func testContainerSingleton3() throws {
        sut.registerSingleton { TestObject() as TestObjectProtocol }

        let resolvedObject1: TestObjectProtocol = sut.resolve()
        let resolvedObject2: TestObjectProtocol = sut.resolve()

        XCTAssert(resolvedObject1 === resolvedObject2, "Objects are not the same")
        XCTAssertEqual(resolvedObject1.testText, "TEST")
        XCTAssertEqual(resolvedObject2.testText, "TEST")
    }

    func testContainerOverride() throws {
        sut.registerSingleton { TestObject() as TestObjectProtocol }
        let resolvedObject1: TestObjectProtocol = sut.resolve()

        sut.registerSingleton { TestObjectExtra() as TestObjectProtocol }
        let resolvedObject2: TestObjectProtocol = sut.resolve()

        XCTAssert(resolvedObject1 !== resolvedObject2, "Objects are the same")
        XCTAssertEqual(resolvedObject1.testText, "TEST")
        XCTAssertEqual(resolvedObject2.testText, "TEST 2")
    }
}
