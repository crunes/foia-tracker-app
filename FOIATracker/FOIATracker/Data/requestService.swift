//
//  birdService.swift
//  FOIATracker
//
//  Created by Charmaine Runes on 10/8/20.
//

import Foundation

enum RequestCallingError: Error {
    case problemGeneratingURL
    case problemGettingDataFromAPI
    case problemDecodingData
}

class RequestService {
    private let urlString = "https://run.mocky.io/v3/697a647c-a411-4357-9335-5ffd2e7f2f78"
    
    // Test empty list: "https://run.mocky.io/v3/454f2346-84ad-47aa-b5e3-beb0466afe6f"
    // Mock FOIA requests: "https://run.mocky.io/v3/697a647c-a411-4357-9335-5ffd2e7f2f78"
    
    //Note: for testing the spinner, use asyncAfter
    
    func getRequests(completion: @escaping ([Request]?, Error?) -> ()) {
        guard let url = URL(string: self.urlString) else {
            DispatchQueue.main.async { completion(nil,
                RequestCallingError.problemGeneratingURL) }
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data,
            response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async { completion(nil,
                    RequestCallingError.problemGettingDataFromAPI)
                }
                return
            }
            
            do {
                let requestResult = try JSONDecoder().decode(RequestResult.self, from: data)
                DispatchQueue.main.async { completion(requestResult.requests, nil)}
            } catch (let error) {
                print(error)
                DispatchQueue.main.async { completion(nil, RequestCallingError.problemDecodingData) }
            }
            
        }
        task.resume()

    }
}
