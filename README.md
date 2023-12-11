# RestCountries App

The RestCountries app is a modern iOS application built using SwiftUI, targeting iOS 17. The app seamlessly retrieves information from an external API to showcase a list of countries. Employing the Model-View-ViewModel (MVVM) architecture, the project adheres to best practices for code organization, maintainability, and separation of concerns.

## Key Features

- **Country List:** The app displays a scrollable list of countries, presenting essential details such as name and population. The list is searchable, enabling users to quickly find specific countries.

- **Country Details:** Selecting a country from the list navigates the user to a detailed view, offering comprehensive information, including population, capital(s), and spoken languages.

- **MVVM Architecture:** Embracing the MVVM architecture, the project organizes code into distinct layers — Model, View, and ViewModel. This separation enhances readability, testability, and scalability of the codebase.

- **Asynchronous Data Fetching:** Utilizing SwiftUI's `onAppear` and `onTapGesture` gestures, the app asynchronously fetches country data from an external API. Additionally, it employs a caching mechanism to enhance performance and provide a smooth user experience.

- **Dynamic UI:** The app leverages SwiftUI's declarative syntax for building dynamic and reactive user interfaces. The use of SwiftUI's components like `List`, `NavigationLink`, and `VStack` contributes to a clean and intuitive UI design.

## MVVM Architecture

MVVM (Model-View-ViewModel) is a design pattern employed in the project to ensure separation of concerns and enhance maintainability. Key aspects include:

- **Model:** Represents the data structure (e.g., `Country` struct) and business logic. The model is responsible for encoding, decoding, and manipulating data.

- **View:** Displays the user interface and handles user interactions. SwiftUI views, such as `CountryListView` and `CountryDetailsView`, are responsible for rendering the UI components.

- **ViewModel:** Acts as an intermediary between the Model and the View. The ViewModel, represented by `CountryListViewModel`, contains the business logic, data management, and interaction with the external API. It notifies the View of data changes, allowing for a reactive UI.

## Network

The `Network` class is a Swift utility designed for handling network requests in the RestCountries app. It encapsulates the logic for fetching country data from an external API, providing a clean interface for data retrieval. Key features and usage guidelines include:

### Features

- **Base URL:** The class incorporates a base URL (`baseURL`) pointing to the Rest Countries API, allowing for easy endpoint construction.

- **Asynchronous Data Retrieval:** The `getCountries` method fetches country data asynchronously, employing a completion handler with a `Result` type to handle success or failure scenarios.

- **Timeout Handling:** Implements a timeout mechanism to prevent indefinite waiting for network responses. If the request times out, the completion handler returns a failure result with a corresponding error.

- **Error Handling:** The class employs comprehensive error handling, including validation of the URL, handling network errors, decoding JSON data, and managing timeouts.

## CacheManager

The `CacheManager` class is a Swift utility that handles caching of country data in the RestCountries app. It provides methods for saving, retrieving, and loading initial data from local storage, enhancing the app's performance and user experience. Key features and usage guidelines include:

### Features

- **Singleton Pattern:** Implemented as a singleton, the `CacheManager` ensures a single instance is shared across the app, promoting a centralized caching mechanism.

- **UserDefaults Storage:** Utilizes `UserDefaults.standard` for persistent storage of cached country data. The `cacheKey` is employed to uniquely identify and access the stored data.

- **Save and Retrieve:** Offers methods such as `saveCountries` and `getCachedCountries` for saving and retrieving country data, respectively. The data is encoded and decoded using JSON serialization.

- **Initial JSON Loading:** Includes a method `loadInitialJSON` to load initial country data from a locally stored JSON file. This is useful for providing data in case of network failures during the app's initial run.

- ## CountryListViewModel

The `CountryListViewModel` is a Swift class designed to serve as the view model for handling country-related data in the RestCountries app. Leveraging the SwiftUI framework, this class provides seamless integration with views, ensuring a dynamic and reactive user interface. Key features and usage guidelines include:

### Features

- **ObservableObject:** The class adopts the `ObservableObject` protocol, enabling SwiftUI to observe and react to changes in its properties. The `@Published` attribute on `countries` and `searchTerm` facilitates two-way data binding.

- **Data Fetching:** The `fetchCountriesData` method initiates the retrieval of country data from an external API using the `Network` class. The data is asynchronously updated, and caching is handled by the `CacheManager` to optimize performance.

- **Initial Data Loading:** In the event of a network failure, the class attempts to load initial country data from a locally stored JSON file using the `cacheManager.loadInitialJSON` method. This ensures a seamless user experience even during the app's initial run.

- **Cached Data Handling:** The `loadCachedData` method fetches and sets cached country data from the `CacheManager`. If no cached data is available, it triggers the fetching of new data from the API.

- **Sorting and Filtering:** The `filteredAndSortedCountries` property provides a dynamically sorted and filtered list of countries based on the search term, ensuring an organized and responsive display.

## CountryListView

The `CountryListView` is a SwiftUI view that displays a list of countries in the RestCountries app. This view seamlessly integrates with the `CountryListViewModel` to provide a dynamic and responsive user interface. Key features and usage guidelines include:

### Features

- **NavigationStack Integration:** The view is embedded within a `NavigationStack` for smooth navigation between screens, enhancing the overall user experience.

- **List Display:** Utilizes SwiftUI's `List` component to present a scrollable list of countries. The list is populated based on the dynamically sorted and filtered data from the `CountryListViewModel`.

- **NavigationLink:** Each list item is wrapped in a `NavigationLink` that navigates to the `CountryDetailsView` when tapped. The destination is set to display detailed information about the selected country.

- **Dynamic Population Display:** Displays each country's name and population in a horizontal stack with dynamic font scaling for improved readability.

- **Asynchronous Data Loading:** The view asynchronously loads cached data on appearance and initiates a background fetch of fresh country data using the `CountryListViewModel`.

- **Searchable:** The list is searchable, allowing users to conveniently filter and find specific countries using the provided search bar.

## CountryDetailsView

The `CountryDetailsView` is a SwiftUI view responsible for presenting detailed information about a specific country in the RestCountries app. This view provides a clear and organized layout for essential country details, enhancing the user's understanding of the selected country. Key features and usage guidelines include:

### Features

- **Title and Basic Information:** Displays the country's name and population as the main title and subtitle, respectively, providing immediate context about the country.

- **Capital Information:** Showcases the capital city or cities of the country in a formatted and readable manner. If there are multiple capitals, they are joined with commas.

- **Languages:** Lists the languages spoken in the country, with each language code and name pair presented in an orderly fashion.

- **Dynamic Font Styles:** Utilizes dynamic font sizes for enhanced readability, ensuring a visually appealing presentation.

- **Spacer for Layout:** Incorporates a spacer at the bottom to maintain proper spacing within the view.

  ## Country Struct

The `Country` struct is a fundamental Swift data structure in the RestCountries app, representing essential information about a country. This Codable and Hashable struct facilitates seamless encoding and decoding of country data, making it compatible with various data formats and storage mechanisms. Key features and usage guidelines include:

### Features

- **Codable and Hashable:** The struct adopts the `Codable` and `Hashable` protocols, enabling effortless serialization and deserialization of country data. This ensures compatibility with JSON formats and provides hashability for use in collections.

- **Nested Struct:** Contains a nested struct `CountryName` to represent the common name of the country. This nested structure enhances code organization and readability.

- **Population Information:** Stores the population of the country as an `Int32` value, representing an integer with 32 bits.

- **Capital Information:** Maintains an array of strings (`[String]`) to accommodate the possibility of multiple capital cities. The capitals are stored as an array for flexibility.

- **Languages Dictionary:** Uses a dictionary (`[String: String]`) to capture language information. The keys represent language codes, and the values represent the corresponding language names.

- **CodingKeys Enumeration:** Implements a custom `CodingKeys` enumeration to explicitly declare the coding keys. This is especially useful when working with APIs or external data sources that have different key names.







