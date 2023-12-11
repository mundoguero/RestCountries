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




