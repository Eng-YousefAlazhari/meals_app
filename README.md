# Meals App

A Flutter recipe discovery app for browsing meals by category, viewing cooking instructions, saving favorites, and filtering recipes by dietary preferences.

## Overview

Meals App organizes a small, locally bundled recipe catalogue into categories and provides a focused view of each meal's ingredients, preparation steps, cooking time, difficulty, and price level. The interface uses Flutter Material components and a dark color scheme.

The current implementation is a **front-end demo backed by in-memory sample data**. It does not connect to a remote recipe API or persist user selections between app launches.

## Features

- **Browse categories** — explore ten predefined categories, including Italian, Quick & Easy, Hamburgers, German, Breakfast, Asian, French, and Summer.
- **Explore meals** — open a category to see the meals associated with it.
- **Meal details** — view the recipe image, ingredient list, and step-by-step preparation instructions.
- **Favorites** — add or remove meals from a favorites list using the star action.
- **Dietary filters** — filter the catalogue by:
  - Gluten-free
  - Lactose-free
  - Vegetarian
  - Vegan
- **Animated interface** — category grid entrance animation, image transitions, and an animated favorite icon.
- **Responsive Flutter UI** — built with standard Flutter widgets and platform project scaffolding.

## Screens and navigation

1. **Categories** — the home screen displays the available recipe categories in a two-column grid.
2. **Category meals** — selecting a category opens the matching meal list.
3. **Meal details** — selecting a meal opens its image, ingredients, and preparation steps. The app bar's star button toggles its favorite state.
4. **Favorites** — the bottom navigation bar opens the list of favorited meals.
5. **Filters** — open the navigation drawer and choose *Filters* to configure dietary preferences. Active filters are applied to the category catalogue.

## Tech stack

| Technology | Usage |
| --- | --- |
| [Flutter](https://flutter.dev/) | Cross-platform application UI |
| [Dart](https://dart.dev/) | Application language |
| [Riverpod 2](https://riverpod.dev/) (flutter_riverpod) | Application state and derived meal filtering |
| [Google Fonts](https://pub.dev/packages/google_fonts) | Lato typography |
| [transparent_image](https://pub.dev/packages/transparent_image) | Lightweight placeholder while meal images load |
| Material Design | Components, theme, navigation, and icons |

### Main dependencies

Declared in pubspec.yaml:

- flutter_riverpod: ^2.5.1
- google_fonts: ^6.2.1
- transparent_image: ^2.0.1
- cupertino_icons: ^1.0.8

Development dependencies include flutter_test and flutter_lints.

## Project structure

~~~text
lib/
├── main.dart                     # App entry point, theme, and ProviderScope
├── data/
│   └── dimmy_data.dart           # Sample categories and recipe records
├── models/
│   ├── category.dart             # CustomCategory model
│   └── meals.dart                # Meal model and recipe enums
├── provider/
│   ├── favorite_provider.dart    # Favorite state and filtered meal provider
│   ├── filters_provider.dart     # Dietary filter state
│   └── meals_provider.dart       # Source meal provider
├── screens/
│   ├── categories.dart            # Category grid and category navigation
│   ├── filters.dart               # Dietary filter controls
│   ├── meal_details_screen.dart   # Recipe details and favorite action
│   ├── meal_screen.dart           # Meal list and empty state
│   └── tabs.dart                  # Main tabs, drawer, and navigation
└── widget/
    ├── category_grid_item.dart    # Category tile
    ├── main_drwer.dart            # Navigation drawer
    ├── meal_item.dart             # Meal card
    └── meal_item_trait.dart       # Meal metadata row
~~~

The repository also contains the standard Flutter platform folders for Android, iOS, web, Windows, Linux, and macOS.

## Getting started

### Requirements

- Flutter SDK compatible with the Dart SDK constraint ^3.6.0 declared in pubspec.yaml.
- Dart SDK (bundled with Flutter).
- An IDE such as Android Studio or VS Code with Flutter and Dart extensions.
- A configured emulator, simulator, or physical device for the platform you want to run.

### 1. Clone the repository

~~~bash
git clone https://github.com/Eng-YousefAlazhari/meals_app.git
cd meals_app
~~~

### 2. Install dependencies

~~~bash
flutter pub get
~~~

### 3. Run the application

~~~bash
flutter run
~~~

To see available devices:

~~~bash
flutter devices
~~~

### Build examples

Build commands depend on the platform toolchain installed on your machine.

~~~bash
# Android APK
flutter build apk

# Android App Bundle
flutter build appbundle

# Web
flutter build web

# iOS (requires macOS and Xcode)
flutter build ios

# Windows (requires the Windows desktop toolchain)
flutter build windows

# Linux (requires the Linux desktop toolchain)
flutter build linux

# macOS (requires macOS and Xcode)
flutter build macos
~~~

## How the app works

### Recipe data

The recipe catalogue is defined in lib/data/dimmy_data.dart as the constant lists availableCategories and dummyMeals. Each Meal contains:

- An ID and one or more category IDs
- A title and remote image URL
- Ingredients and preparation steps
- Duration in minutes
- An Affordability value (affordable, pricey, or luxurious)
- A Complexity value (simple, challenging, or hard)
- Boolean dietary attributes (isGlutenFree, isLactoseFree, isVegan, and isVegetarian)

### State management

The app is wrapped in Riverpod's ProviderScope in main.dart.

- mealsProvider exposes the bundled sample meals.
- filtersProvider stores the four dietary filter switches.
- filteredMealsProvider derives the meals that satisfy every active dietary filter.
- favoriteMealsProvider stores the current favorites and toggles a meal by its ID.

Favorites and filter selections are held in application memory. They are reset when the app process is restarted.

## Current scope and limitations

- **Sample content:** recipes and categories are hard-coded in lib/data/dimmy_data.dart; there is no backend, database, or remote content management.
- **Remote images:** meal images are loaded from URLs in the sample data, so image display depends on the referenced hosts and network access.
- **Session-only state:** favorites and dietary preferences are not saved to local storage.
- **No authentication:** the app has no user accounts or sign-in flow.
- **No automated test suite is currently included in the repository.**
- **Recipe metadata:** dietary flags and category associations are supplied with the sample records; they should be reviewed for correctness before using the catalogue as dietary or allergy guidance.

## Development checks

Run the static analyzer:

~~~bash
flutter analyze
~~~

Run tests (when test files are added):

~~~bash
flutter test
~~~

Format Dart source files:

~~~bash
dart format lib
~~~

## Contributing

Contributions are welcome. A useful workflow is:

1. Fork the repository.
2. Create a focused feature or fix branch.
3. Make the change and run dart format lib and flutter analyze.
4. Add or update tests where appropriate.
5. Open a pull request with a clear description of the change.

## License

No license file is currently present in this repository. Unless the project owner adds a license, the source code should be treated as **all rights reserved**; do not assume that it is available for reuse or redistribution.

## Author

**Yousef Alazhari**

- GitHub: [@Eng-YousefAlazhari](https://github.com/Eng-YousefAlazhari)
- Repository: [Eng-YousefAlazhari/meals_app](https://github.com/Eng-YousefAlazhari/meals_app)
