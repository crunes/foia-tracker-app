//
//  RequestServiceTests.swift
//  FOIATrackerTests
//
//  Created by Charmaine Runes on 10/22/20.
//

import XCTest
@testable import FOIATracker

class RequestServiceTests: XCTestCase {
    
    var systemUnderTest: RequestService!

    override func setUpWithError() throws {
        self.systemUnderTest = RequestService()
    }

    override func tearDownWithError() throws {
        self.systemUnderTest = nil
    }

    func testAPI_returnsSuccessfulResult() {
        //Given
        var requests: [Request]!
        var error: Error?
        
        let promise = expectation(description: "Completion handler is invoked")
        
        //When
        self.systemUnderTest.getRequests(completion: { data, shouldntHappen in
            requests = data
            error = shouldntHappen
            promise.fulfill()
        })
        
        wait(for: [promise], timeout: 5)
        
        //Then
        XCTAssertNotNil(requests)
        XCTAssertNil(error)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
