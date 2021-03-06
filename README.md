# Nasa App

 π **Project Summary:** The application of images of vehicle with Nasa open source api. 

- [API Link](https://api.nasa.gov/index.html)




https://user-images.githubusercontent.com/45641833/169718641-80347daf-c847-430f-b67c-146d57e7bfc5.mp4


## Project Design:

- **Design Tool:** Adobe XD

- **Color Palette:** Colorhunt

- **Fonts:** Google Fonts

- **Splash Animation:** Lottie Files

<img width="931" alt="nasaappdesign" src="https://user-images.githubusercontent.com/45641833/169718489-afeff40a-2c16-4459-b1d7-29ef1dce8c07.png">


## Mockup:

- Splash
- Home
- Filter (Pop-up)
- Images Detail (Pop-up)
- Spirit Vehicle Page
- Curiosity Vehicle Page 
- Opportunity Vehicle Page 

<img width="932" alt="mockup" src="https://user-images.githubusercontent.com/45641833/169718496-d90d782b-d58b-41f1-8857-c9d240253ac7.png">

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
β   
ββββlib
    β
    ββββcore
    β    β    
    β    ββββbase
    β    β   ββββcubits
    β    β   ββββmodel
    β    β   ββββrepositories
    β    β
    β    ββββcomponents
    β    β    ββββbox
    β    β    ββββcard
    β    β    ββββlist_tile
    β    β    ββββpop_up
    β    β    ββββprogress_indicator
    β    β    
    β    ββββconstants
    β    β    ββββimage_constant
    β    β    ββββrouter_constant
    β    β    ββββtext_constant
    β    β    ββββurl_constant
    β    β
    β    ββββextensions
    β    β    ββββcontext_extension
    β    β
    β    ββββrouter
    β    β    ββββapp_router
    β    β
    β    ββββtheme
    β    β    ββββapp_theme_light
    β    β    ββββapp_theme
    β    β    ββββcolor_theme
    β    β    ββββtext_theme
    β    β    ββββtheme_interface_light
    β    β
    β    ββββutils
    β    β    ββββcamera_filter_enum
    β    β    ββββlocator
    β    β    ββββnetwork_error
    ββββview
         ββββhome
         β    ββββview
         ββββlaunch 
              ββββview
```

## Flutter Packages Available in the Project:

**flutter_screenutil:** A flutter plugin for adapting screen and font size.Guaranteed to look good on different models.

**flutter_bloc:** Flutter Widgets that make it easy to implement the BLoC (Business Logic Component) design pattern. Built to be used with the bloc state management package.

**google_fonts:** A package to include fonts from fonts.google.com in your Flutter app.

**lottie:** Render After Effects animations natively on Flutter. This package is a pure Dart implementation of a Lottie player.

**intl:** Contains code to deal with internationalized/localized messages, date and number formatting and parsing, bi-directional text, and other internationalization issues.

**http:** A composable, multi-platform, Future-based API for HTTP requests.

**get_it:** Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App.


