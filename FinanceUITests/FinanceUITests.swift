//
//  FinanceUITests.swift
//  FinanceUITests
//
//  Created by Даниил Виноградов on 02.02.2023.
//

import XCTest

final class FinanceUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let stonksNavigationBar = app.navigationBars.element
        stonksNavigationBar.searchFields.element.tap()

        let gKey = app/*@START_MENU_TOKEN@*/.keys["G"]/*[[".keyboards.keys[\"G\"]",".keys[\"G\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        gKey.tap()

        stonksNavigationBar.buttons["Cancel"].tap()

        XCUIApplication().tables/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"^GSPC")/*[[".cells.containing(.staticText, identifier:\"-43,28 \")",".cells.containing(.staticText, identifier:\"4 136,48 \")",".cells.containing(.staticText, identifier:\"S&P 500\")",".cells.containing(.staticText, identifier:\"^GSPC\")"],[[[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.element.tap()
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.staticTexts["Loading..."].tap()
        elementsQuery.staticTexts["^GSPC"].tap()
        app.navigationBars.element.buttons.element.tap()
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
