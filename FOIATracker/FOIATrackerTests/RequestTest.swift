//
//  RequestTest.swift
//  FOIATrackerTests
//
//  Created by Charmaine Runes on 10/22/20.
//

import XCTest
@testable import FOIATracker

class RequestTest: XCTestCase {

    func testRequestDebugDescription() {
        //Given
        let subjectUnderTest = Request(
                                for: "Mayor's Office",
                                description: "All emails re: the 2021 community engagement budget survey",
                                imageUrl: "https://tinyurl.com/chimayorsoffice",
                                story: "Moving from #DefundCPD to budget cuts"
                            )
            
        //When
        let actualValue = subjectUnderTest.debugDescription
            
        //Then
        let expectedValue = "Request(for: Mayor's Office, description: All emails re: the 2021 community engagement budget survey)"
            
        XCTAssertEqual(actualValue, expectedValue)
        
    }
}
