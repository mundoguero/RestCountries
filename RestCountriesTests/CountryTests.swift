//
//  CountryTests.swift
//  RestCountriesTests
//
//  Created by Jonatas Brisotti on 11/12/23.
//

import XCTest
@testable import RestCountries

class CountryTests: XCTestCase {

    func testCountryProperties() {
        // Create a sample country
        let sampleCountry = Country(
            name: Country.CountryName(common: "TestCountry"),
            population: 1000000,
            capital: ["TestCapital"],
            languages: ["en": "English"]
        )

        // Validate the data using getters
        XCTAssertEqual(sampleCountry.name.common, "TestCountry")
        XCTAssertEqual(sampleCountry.population, 1000000)
        XCTAssertEqual(sampleCountry.capital, ["TestCapital"])
        XCTAssertEqual(sampleCountry.languages, ["en": "English"])
    }

    func testViewModelSorting() {
        let viewModel = CountryListViewModel()

        // Assuming there is some sample countries
        let country1 = Country(name: Country.CountryName(common: "Brazil"), population: 200000000, capital: ["Brasilia"], languages: ["pt": "Portuguese"])
        let country2 = Country(name: Country.CountryName(common: "Argentina"), population: 45000000, capital: ["Buenos Aires"], languages: ["es": "Spanish"])

        // Add the countries to the view model
        viewModel.countries = [country1, country2]

        // Check if the countries are now sorted alphabetically
        XCTAssertEqual(viewModel.filteredAndSortedCountries, [country2, country1])
    }

    // Add more test cases as needed

}

