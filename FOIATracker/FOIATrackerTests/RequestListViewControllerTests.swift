//
//  RequestListViewControllerTests.swift
//  FOIATrackerTests
//
//  Created by Charmaine Runes on 10/22/20.
//

import XCTest
@testable import FOIATracker

class RequestListViewControllerTests: XCTestCase {
    var systemUnderTest: RequestListViewController!

    override func setUpWithError() throws {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        self.systemUnderTest = navigationController.topViewController as? RequestListViewController
        
        UIApplication.shared.windows
            .filter { $0.isKeyWindow }
            .first!
            .rootViewController = self.systemUnderTest
        
        XCTAssertNotNil(navigationController.view)
        XCTAssertNotNil(self.systemUnderTest.view)
        
    }

    func testTableView_loadsRequests() {
        
        // Given
        let mockRequestService = MockRequestService()
        let mockRequests = [
            Request(for: "Development and Planning Department", description: "All emails re: HILCO demolition in Little Village", imageUrl: "hilco.com/demolition", story: "Birds, Bikes and Environmental Justice"),
            Request(for: "Department of Public Health", description: "All emails re: opening bars", imageUrl: "cdph.gov/covid-reopening", story: "Preparing for Chicago's second-surge"),
            Request(for: "Chicago Police Department", description: "All emails re: mask guidance", imageUrl: "cpd.gov/masks", story: "Why police are a public health risk")
        ]
        mockRequestService.mockRequests = mockRequests
        
        self.systemUnderTest.viewDidLoad()
        self.systemUnderTest.requestService = mockRequestService
        
        // Make sure the TableView is empty
        XCTAssertEqual(0, self.systemUnderTest.tableView.numberOfRows(inSection: 0))
        
        // When
        self.systemUnderTest.viewWillAppear(false)

        // Then
        XCTAssertEqual(mockRequests.count, self.systemUnderTest.requests.count)
        XCTAssertEqual(mockRequests.count, self.systemUnderTest.tableView.numberOfRows(inSection: 0))
        
    }
    
    class MockRequestService: RequestService {
        var mockRequests: [Request]?
        var mockError: Error?
        
        override func getRequests(completion: @escaping ([Request]?, Error?) -> ()) {
            completion(mockRequests, mockError)
        }
    }


}
