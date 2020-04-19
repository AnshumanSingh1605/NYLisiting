//
//  EndPointsTests.swift
//  EndPointsTests
//
//  Created by Anshuman on 19/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import XCTest
@testable import EndPoints

class EndPointsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testTestRun() {
        let expect = expectation(description: "Fetch request completed...")
        
        UserEndpoints.fetchListing(1).requestWithGenerics { (_, statusCode, model : BlankResponse?, error) in
            if error != nil {
                expect.fulfill()
            } else if statusCode != 401 || statusCode != 429 {
                expect.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if error != nil {
                print("fetch request failed........")
            }
        }
    }
}

struct BlankResponse : Codable {
    
}
