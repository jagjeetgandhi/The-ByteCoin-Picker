//
//  ByteCoinTests.swift
//  ByteCoinTests
//
//  Created by jagjeet on 10/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import XCTest

class ByteCoinTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testprofit() {
        XCTAssert(calculate.profit(cp: 100, sp: 200)==100.00)
        XCTAssert(calculate.profit(cp: 500, sp: 100)==0)
        XCTAssert(calculate.profit(cp: 200, sp: 300)==50.00)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
