//
//  ContentView.swift
//  RestCountries
//
//  Created by Jonatas Brisotti on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var countries = [Country]()
    @State private var searchTerm = ""
    
    var filteredCountries: [Country] {
        guard !searchTerm.isEmpty else { return countries }
        return countries.filter { $0.name.common.localizedCaseInsensitiveContains(searchTerm) }
    }
    
    var body: some View {
        NavigationStack {
            List (filteredCountries, id: \.self) { country in
                HStack(spacing: 10) {
                    Text (country.name.common)
                        .bold()
                        .minimumScaleFactor (0.5)
                    
                    Spacer()
                    
                    Text("\(country.population)")
                        .bold()
                        .foregroundColor(.gray)
                }
            }
            
            .onAppear(){
                getCountriesData()
            }
            .navigationTitle("Countries")
            .searchable(text: $searchTerm, prompt: "Search Country")
        }
    }
}

extension ContentView {
    func getCountriesData() {
        Network().getCountries { (result) in
            switch result {
            case.success(let countries):
                DispatchQueue.main.async {
                    self.countries = countries
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

#Preview {
    ContentView()
}
