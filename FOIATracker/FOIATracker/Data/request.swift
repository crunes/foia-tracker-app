//
//  request.swift
//  FOIATracker
//
//  Created by Charmaine Runes on 10/8/20.
//

import Foundation

class Request: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Request[name: \(self.department), description: \(self.description)]"
    }
    
    var department: String
    var description: String
    var imageUrl: String
    var receivedResponse: Bool = false
    
    init(for department: String, description: String, imageUrl: String) {
        self.department = department
        self.description = description
        self.imageUrl = imageUrl
        //self.receivedResponse = receivedResponse
        
    }
}

