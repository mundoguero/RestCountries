//
//  Network.swift
//  RestCountries
//
//  Created by Jonatas Brisotti on 05/12/23.
//

import Foundation

class Network {
    
    func getCountries(completion: @escaping (Result<[Country], Error>) -> Void) {
        guard let url = URL(string: "https://restcountries.com/v3.1/all?fields=name,population,capital,languages") else {
            print("Invalid URL!"); return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
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
        }.resume()
    }
}


