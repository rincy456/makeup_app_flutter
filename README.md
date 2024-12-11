# Makeup App Flutter

This Flutter app fetches makeup product data from the [Dummy JSON API](https://dummyjson.com/products?limit=10) and displays it.

## Architecture

- **State Management**: The app uses `StatefulWidget` for managing state locally in the `HomeScreen`. Products are fetched asynchronously when the screen is initialized using `FutureBuilder`.
- **Network Service**: `NetworkService` class is used to fetch the list of products from the API. It makes use of the `http` package to make the API call and parse the data into the `Product` model.

## Screens

- **Home Screen**: Displays the list of products fetched from the API.

