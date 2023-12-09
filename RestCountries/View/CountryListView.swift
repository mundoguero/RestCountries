//
//  CountryListView.swift
//  RestCountries
//
//  Created by Jonatas Brisotti on 05/12/23.
//

import SwiftUI

struct CountryListView: View {
    @StateObject private var viewModel = CountryListViewModel()
    @State private var selectedCountry: Country?

    var body: some View {
        NavigationStack {
            List(viewModel.filteredCountries, id: \.self) { country in
                
                NavigationLink(
                    destination: CountryDetailsView(country: country),
                    tag: country,
                    selection: $selectedCountry
                ) 
                {
                    HStack(spacing: 10) {
                        Text(country.name.common)
                            .bold()
                            .minimumScaleFactor(0.5)

                        Spacer()

                        Text("\(country.population)")
                            .bold()
                            .foregroundColor(.gray)
                    }
                    .onTapGesture {
                        selectedCountry = country
                    }
                }
            }
            .onAppear {
                // Load cached data
                viewModel.loadCachedData()

                // Fetch the latest data from the network in the background
                DispatchQueue.global().async {
                    viewModel.fetchCountriesData()
                }
            }

            .navigationTitle("Countries")
            .searchable(text: $viewModel.searchTerm, prompt: "Search Country")
        }
    }
}

#Preview {
    CountryListView()
}
