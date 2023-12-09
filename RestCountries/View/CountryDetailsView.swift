//
//  CountryDetailsView.swift
//  RestCountries
//
//  Created by Jonatas Brisotti on 08/12/23.
//

import SwiftUI

struct CountryDetailsView: View {
    var country: Country
    
    var body: some View {
        VStack {
            Text("Country: \(country.name.common)")
                .font(.title)

            Text("Population: \(country.population)")
                .foregroundColor(.gray)

            Text("Capital: \(country.capital.joined(separator: ", "))")
                .foregroundColor(.gray)

            Text("Languages:")
            ForEach(country.languages.sorted(by: <), id: \.key) { code, name in
                Text("\(code): \(name)")
            }
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("Country Details")
    }
}


#Preview {
    CountryDetailsView(country: Country(name: Country.CountryName(common: "Brazil"), population: 200000000, capital: ["Brasilia"], languages: ["pt": "Portuguese"]))
}
