//
//  request.swift
//  FOIATracker
//
//  Created by Charmaine Runes on 10/8/20.
//

import Foundation

class Request: CustomDebugStringConvertible, Codable {
    var debugDescription: String {
        return "Request(for: \(self.department), description: \(self.description))"
    }
    
    var department: String
    var description: String
    var imageUrl: String
    var story: String
    
    var receivedResponse: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case department, description, imageUrl, story
    }
    
    init(for department: String, description: String, imageUrl: String, story: String) {
        self.department = department
        self.description = description
        self.imageUrl = imageUrl
        self.story = story
        //self.receivedResponse = receivedResponse
    }
}

struct RequestResult: Codable {
    let requests: [Request]
}

