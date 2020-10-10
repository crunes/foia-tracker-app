//
//  request.swift
//  FOIATracker
//
//  Created by Charmaine Runes on 10/8/20.
//

import Foundation

class Request {
    var department: String
    var description: String
    var receivedResponse: Bool = false
    
    init(for department: String, description: String, receivedResponse: Bool) {
        self.department = department
        self.description = description
        self.receivedResponse = receivedResponse
    }
}

