//
//  CountryListViewModel.swift
//  RestCountries
//
//  Created by Jonatas Brisotti on 07/12/23.
//

import Foundation

class CountryListViewModel: ObservableObject {
    @Published var countries = [Country]()
    @Published var searchTerm = ""

    func getCountriesData() {
        Network().getCountries { result in
            switch result {
            case .success(let countries):
                DispatchQueue.main.async {
                    self.countries = countries
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    var filteredCountries: [Country] {
        guard !searchTerm.isEmpty else { return countries }
        return countries.filter { $0.name.common.localizedCaseInsensitiveContains(searchTerm) }
    }
}

