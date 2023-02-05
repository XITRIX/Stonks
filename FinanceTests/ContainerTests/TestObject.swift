//
//  TestObject.swift
//  FinanceTests
//
//  Created by Даниил Виноградов on 05.02.2023.
//

import Foundation

protocol TestObjectProtocol: AnyObject {
    var testText: String { get }
}

class TestObject: TestObjectProtocol {
    var testText: String { "TEST" }
}

class TestObjectExtra: TestObjectProtocol {
    var testText: String { "TEST 2" }
}

protocol TestStructProtocol: Equatable {
    var uuid: UUID { get }
    var testText: String { get }
}

struct TestStruct: TestStructProtocol {
    let uuid = UUID()
    var testText: String { "TEST" }
}
