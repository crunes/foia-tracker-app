//
//  birdService.swift
//  FOIATracker
//
//  Created by Charmaine Runes on 10/8/20.
//

import Foundation

class RequestService {
    func getRequests() -> [Request] {
        return [
            Request(for: "Chicago Department of Public Health",
                    description: "All documents related to lead",
                    receivedResponse: true),
            Request(for: "Chicago Police Department",
                    description: "All emails related to mask guidance",
                    receivedResponse: false),
            Request(for: "Department of Cultural Affairs and Special Events",
                    description: "All contracts with festival vendors in 2020",
                    receivedResponse: true),
            Request(for: "Department of Family and Support Services",
                    description: "All records pertaining to domestic violence programs",
                    receivedResponse: true),
            Request(for: "Office of the Mayor",
                    description: "All emails related to the community engagement budget survey",
                    receivedResponse: false),
            Request(for: "Chicago Department of Public Health",
                    description: "All documents related to lead",
                    receivedResponse: true),
            Request(for: "Chicago Police Department",
                    description: "All emails related to mask guidance",
                    receivedResponse: false),
            Request(for: "Department of Cultural Affairs and Special Events",
                    description: "All contracts with festival vendors in 2020",
                    receivedResponse: true),
            Request(for: "Department of Family and Support Services",
                    description: "All records pertaining to domestic violence programs",
                    receivedResponse: true),
            Request(for: "Office of the Mayor",
                    description: "All emails related to the community engagement budget survey",
                    receivedResponse: false),
            Request(for: "Chicago Department of Public Health",
                    description: "All documents related to lead",
                    receivedResponse: true),
            Request(for: "Chicago Police Department",
                    description: "All emails related to mask guidance",
                    receivedResponse: false),
            Request(for: "Department of Cultural Affairs and Special Events",
                    description: "All contracts with festival vendors in 2020",
                    receivedResponse: true),
            Request(for: "Department of Family and Support Services",
                    description: "All records pertaining to domestic violence programs",
                    receivedResponse: true),
            Request(for: "Office of the Mayor",
                    description: "All emails related to the community engagement budget survey",
                    receivedResponse: false)
        ]
    }
}
