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

    struct CountryName: Codable, Hashable {
        var common: String
    }
}

