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
        VStack(spacing: 10) {
            Text(country.name.common)
                .font(.title)
                .bold()

            Group {
                InformationRow(title: "Population:", value: "\(country.population)")
                InformationRow(title: "Capital:", value: country.capital.joined(separator: ", "))
                InformationRow(title: "Languages:", value: nil)
                ForEach(country.languages.sorted(by: <), id: \.key) { code, name in
                    InformationRow(title: nil, value: "\(code): \(name)")
                        .padding(.leading, 20)
                }
            }
            .foregroundColor(.gray)

            Spacer()
        }
        .padding()
        .navigationTitle("Country Details")
    }
}

struct InformationRow: View {
    var title: String?
    var value: String?
    
    var body: some View {
        HStack {
            if let title = title {
                Text(title)
                    .font(.body)
                    .foregroundColor(.primary)
                    .frame(width: 120, alignment: .leading)
            }
            
            if let value = value {
                Text(value)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
    }
}

struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsView(country: Country(name: Country.CountryName(common: "Brazil"), population: 200000000, capital: ["Brasilia"], languages: ["pt": "Portuguese"]))
    }
}

