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
    private let urlString = "https://run.mocky.io/v3/ac732df1-7bf5-4d6e-9e65-d421d497b8fc"
    
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
                    RequestCallingError.problemGettingDataFromAPI) }
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
