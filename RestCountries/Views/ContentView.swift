//
//  ContentView.swift
//  RestCountries
//
//  Created by Jonatas Brisotti on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CountryListViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.filteredCountries, id: \.self) { country in
                HStack(spacing: 10) {
                    Text(country.name.common)
                        .bold()
                        .minimumScaleFactor(0.5)

                    Spacer()

                    Text("\(country.population)")
                        .bold()
                        .foregroundColor(.gray)
                }
            }
            .onAppear {
                viewModel.getCountriesData()
            }
            .navigationTitle("Countries")
            .searchable(text: $viewModel.searchTerm, prompt: "Search Country")
        }
    }
}


#Preview {
    ContentView()
}
