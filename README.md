# Nasa App

 🚀 **Project Summary:** The application of images of vehicle with Nasa open source api. 

- [API Link](https://api.nasa.gov/index.html)

## Project Design:

- **Design Tool:** Adobe XD

- **Color Palette:** Colorhunt

- **Fonts:** Google Fonts

- **Splash Animation:** Lottie Files

## Mockup:

- Splash
- Home
- Filter (Pop-up)
- Images Detail (Pop-up)
- Spirit Vehicle Page
- Curiosity Vehicle Page 
- Opportunity Vehicle Page 

## Subject:

- **BLoC/Cubit** was used for State Management.

- **Get It** was used for dependencies injected.

- **HTTP** was used for API requests.

- For pagination and infinite Scroll, **Infinite Scroll Pagination** was used.

- **Screen Util** adapting screen and font size.

- **Intl** was used for the date format.

## Folder Structure:

```
nasa_app
│   
└───lib
    │
    └───core
    │    │    
    │    └───base
    │    │   └───cubits
    │    │   └───model
    │    │   └───repositories
    │    │
    │    └───components
    │    │    └───box
    │    │    └───card
    │    │    └───list_tile
    │    │    └───pop_up
    │    │    └───progress_indicator
    │    │    
    │    └───constants
    │    │    └───image_constant
    │    │    └───router_constant
    │    │    └───text_constant
    │    │    └───url_constant
    │    │
    │    └───extensions
    │    │    └───context_extension
    │    │
    │    └───router
    │    │    └───app_router
    │    │
    │    └───theme
    │    │    └───app_theme_light
    │    │    └───app_theme
    │    │    └───color_theme
    │    │    └───text_theme
    │    │    └───theme_interface_light
    │    │
    │    └───utils
    │    │    └───camera_filter_enum
    │    │    └───locator
    │    │    └───network_error
    └───view
         └───home
         │    └───view
         └───launch 
              └───view
```

## Flutter Packages Available in the Project:

**flutter_screenutil:** A flutter plugin for adapting screen and font size.Guaranteed to look good on different models.

**flutter_bloc:** Flutter Widgets that make it easy to implement the BLoC (Business Logic Component) design pattern. Built to be used with the bloc state management package.

**google_fonts:** A package to include fonts from fonts.google.com in your Flutter app.

**lottie:** Render After Effects animations natively on Flutter. This package is a pure Dart implementation of a Lottie player.

**intl:** Contains code to deal with internationalized/localized messages, date and number formatting and parsing, bi-directional text, and other internationalization issues.

**http:** A composable, multi-platform, Future-based API for HTTP requests.

**get_it:** Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App.


