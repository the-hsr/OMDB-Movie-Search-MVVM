# 🎬 OMDB Movie Search App

A simple SwiftUI-based macOS/iOS app that lets users search for movies using the OMDb (Open Movie Database) API. It includes networking, localization, error handling, and a polished UI with async image loading.

---

## 🚀 Features

- 🔍 Search for movies by title using the OMDb API
- 🧾 Displays movie title, year, and poster
- 💬 Localized UI strings (via `.strings` file, assumed)
- 🔁 Handles loading states and error messages
- 🎨 Modern SwiftUI interface with `AsyncImage`
- 📡 Uses Combine for reactive data loading

---

## 📦 Project Structure

- **`Movie`**: Model representing a movie, conforms to `Decodable` and `Identifiable`.
- **`MovieSearchResponse`**: Model to decode the API response.
- **`MovieSearchViewModel`**: ViewModel using Combine to manage API calls and UI state.
- **`ContentView`**: Main UI including search bar, result list, and loading/error handling.
- **`CommonStrings`**: Centralized localized strings.
- **`OMDBApp`**: SwiftUI entry point of the application.

---

## 🛠 Setup Instructions

1. Clone the repo:
   ```bash
   git clone https://github.com/the-hsr/OMDB-Movie-Search-MVVM.git
   cd OMDB
   ```

2. Open in Xcode:
   ```bash
   open OMDBApp.xcodeproj
   ```

3. (Optional) Update the API key in `MovieSearchViewModel.swift`:
   ```swift
   private let apiKey = "your_omdb_api_key"
   ```
   You can get one for free from [http://www.omdbapi.com/apikey.aspx](http://www.omdbapi.com/apikey.aspx)

4. Run the project on macOS or iOS simulator.

---

## 🌍 Localization

All static UI text is handled using `CommonStrings`, backed by a `Common.strings` file (not shown here). This makes the app easily localizable for multiple languages.

Example usage:
```swift
Text(CommonStrings.searchMovie)
```
---

## 📋 Dependencies

- Swift 5+
- SwiftUI
- Combine
- OMDb API

---

## 🤝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 🙋‍♂️ Author

**Your Name**  
Feel free to connect on [GitHub](https://github.com/the-hsr) or [LinkedIn](https://www.linkedin.com/in/himanshu---singh/)
