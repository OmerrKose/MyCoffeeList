# MyCoffeeList

A simple iOS app built with SwiftUI that allows users to view a list of hot and iced coffee options. Users can toggle between hot and iced coffee categories, view coffee details, and explore coffee ingredients.

## Features
- Display a list of hot and iced coffees.
- Fetch coffee data from a public API (`https://api.sampleapis.com/coffee/hot` and `https://api.sampleapis.com/coffee/iced`).
- View detailed coffee information, including ingredients.
- Toggle between hot and iced coffee categories.
- Present a coffee detail view as a sheet when a coffee item is tapped.

## Technologies Used
- SwiftUI for the user interface.
- `URLSession` for fetching data from an external API.
- `AsyncImage` for displaying images asynchronously.
- Combine framework (optional, depending on your implementation).

## Structure

CoffeeApp/ │ ├── ViewModel/ │ └── CoffeeViewModel.swift # ViewModel responsible for fetching coffee data │ ├── View/ │ ├── ContentView.swift # Main view displaying the list of coffees │ ├── CoffeeCardView.swift # Custom card view for displaying coffee items │ └── CoffeeDetailView.swift # View displaying detailed information about a coffee │ └── Model/ └── Coffee.swift # Data model representing a coffee item
