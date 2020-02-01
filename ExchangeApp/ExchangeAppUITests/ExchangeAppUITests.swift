//
//  ExchangeAppUITests.swift
//  ExchangeAppUITests
//
//  Created by Kusyumov Nikita on 29.01.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import XCTest

class ExchangeAppUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testTablePaginationScroll() {
        
        let app = XCUIApplication()
        let collectionViewsQuery = app.collectionViews
        guard let cell = collectionViewsQuery.allElementsBoundByIndex.first else { return }
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        let stringDate = dateFormatter.string(from: date)
        
        cell.staticTexts[stringDate].tap()
        app.navigationBars[stringDate].buttons["Back"].tap()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
