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
    var daysSinceFiled: Int
    
    init(for department: String, description: String, daysSinceFiled: Int) {
        self.department = department
        self.description = description
        self.daysSinceFiled = daysSinceFiled
    }
}

