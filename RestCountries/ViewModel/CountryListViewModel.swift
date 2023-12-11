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
                
                if self?.countries.isEmpty ?? true, let initialJSON = self?.cacheManager.loadInitialJSON() {
                    DispatchQueue.main.async {
                        self?.countries = initialJSON
                    }
                }
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
    
    var filteredAndSortedCountries: [Country] {
        if !searchTerm.isEmpty {
            return countries.filter { $0.name.common.localizedCaseInsensitiveContains(searchTerm) }
                .sorted { $0.name.common < $1.name.common }
        } else {
            return countries.sorted { $0.name.common < $1.name.common }
        }
    }
    
}



