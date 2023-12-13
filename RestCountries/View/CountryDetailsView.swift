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
        VStack(spacing: 15) {
            Text(country.name.common)
                .font(.title)
                .bold()

            Group {
                InformationRow(title: "Population:", value: "\(country.population)")
                InformationRow(title: "Capital:", value: country.capital.joined(separator: ", "))
                InformationRow(title: "Languages:", value: "\(country.languages.values.joined(separator: ", "))")
            }
            .foregroundColor(.gray)
        }
        .padding(35)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(radius: 5)
        )
        .padding()
        .navigationTitle("Country Details")
    }
}

struct InformationRow: View {
    var title: String?
    var value: String?
    
    var body: some View {
        HStack {
            Spacer()

            if let title = title {
                Text(title)
                    .font(.body)
                    .foregroundColor(.primary)
                    .frame(alignment: .trailing)
            }
            
            if let value = value {
                Text(value)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(alignment: .leading)
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

