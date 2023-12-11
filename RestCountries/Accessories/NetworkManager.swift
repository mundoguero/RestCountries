//
//  Network.swift
//  RestCountries
//
//  Created by Jonatas Brisotti on 05/12/23.
//

import Foundation

class Network {

    private let baseURL = "https://restcountries.com"

    func getCountries(completion: @escaping (Result<[Country], Error>) -> Void) {

        guard let url = URL(string: "\(baseURL)/v3.1/all?fields=name,population,capital,languages") else {
            print("Invalid URL!")
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }

        let semaphore = DispatchSemaphore(value: 0)

        let timeoutInterval: TimeInterval = 4

        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = timeoutInterval
        let session = URLSession(configuration: sessionConfig)

        let dataTask = session.dataTask(with: url) { (data, response, error) in
            defer {
                semaphore.signal()
            }

            if let error = error {
                completion(.failure(error))
                return
            }

            do {
                let countries = try JSONDecoder().decode([Country].self, from: data!)
                completion(.success(countries))
                print(countries)
            } catch {
                completion(.failure(error))
            }
        }

        dataTask.resume()

        let result = semaphore.wait(timeout: .now() + timeoutInterval)
        if result == .timedOut {
            dataTask.cancel()
            completion(.failure(NSError(domain: "Network request timed out", code: 408, userInfo: nil)))
        }
    }
}




