//
//  CacheManager.swift
//  RestCountries
//
//  Created by Jonatas Brisotti on 09/12/23.
//

import Foundation

class CacheManager {
    static let shared = CacheManager()

    private let userDefaults = UserDefaults.standard
    private let cacheKey = "cachedCountries"

    func saveCountries(_ countries: [Country]) {
        do {
            let encodedData = try JSONEncoder().encode(countries)
            userDefaults.set(encodedData, forKey: cacheKey)
        } catch {
            print("Error encoding countries: \(error.localizedDescription)")
        }
    }

    func getCachedCountries() -> [Country]? {
        guard let encodedData = userDefaults.data(forKey: cacheKey) else {
            return nil
        }

        do {
            let countries = try JSONDecoder().decode([Country].self, from: encodedData)
            return countries
        } catch {
            print("Error decoding countries: \(error.localizedDescription)")
            return nil
        }
    }
    
    func loadInitialJSON() -> [Country]? {
            if let path = Bundle.main.path(forResource: "initialData", ofType: "json"),
               let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                do {
                    let countries = try JSONDecoder().decode([Country].self, from: data)
                    return countries
                } catch {
                    print("Error decoding initial JSON: \(error.localizedDescription)")
                    return nil
                }
            }
            return nil
        }
    }


