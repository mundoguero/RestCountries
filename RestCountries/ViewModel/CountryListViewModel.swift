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

    private let cacheManager = CacheManager()

    init() {
        loadCachedData()
    }

    func fetchCountriesData() {
        Network().getCountries { [weak self] result in
            switch result {
            case .success(let countries):
                DispatchQueue.main.async {
                    self?.countries = countries
                    self?.cacheManager.saveCountries(countries)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func loadCachedData() {
        if let cachedCountries = cacheManager.getCachedCountries() {
            self.countries = cachedCountries
        }
        
         if countries.isEmpty {
             fetchCountriesData()
         }
    }

    var filteredCountries: [Country] {
        guard !searchTerm.isEmpty else { return countries }
        return countries.filter { $0.name.common.localizedCaseInsensitiveContains(searchTerm) }
    }
}



