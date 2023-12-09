//
//  Countries.swift
//  RestCountries
//
//  Created by Jonatas Brisotti on 05/12/23.
//

import Foundation

struct Country: Codable, Hashable {
    var name: CountryName
    var population: Int32
    var capital: [String]
    var languages: [String: String]

    struct CountryName: Codable, Hashable {
        var common: String
    }
    
    enum CodingKeys: String, CodingKey {
        case name, population, capital, languages
    }
    
}

