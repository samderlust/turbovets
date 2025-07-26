# TurboVest Mobile App

## How to run the app

- Flutter version 3.29.0

1. Install dependencies

```bash
flutter pub get
```

2. Run build_runner to generate code

```bash
dart run build_runner build --delete-conflicting-outputs
```

3. Run the app

```bash
flutter run
```

## App Structure

This app follows clean architecture principles with a feature-based organization.
each feature has its own folder with the following structure:

```
features/
  feature_name/
    data/
      repo/ # data source implementations
    domain/
      entities/ # entities and models
      repo/ # interfaces for data sources
    presentation/
      views/ # UI components
      view_models/ # view models
      providers/ # Riverpod providers
```

## App Flow

### 1. Startup & Authentication

The app starts with a splash screen while performing startup tasks and user authentication.

### 2. Home Screen

After authentication, users navigate to the Home Screen featuring a bottom navigation bar with two main sections:

- **Chat List Screen** (default)
- **Webpage Screen**

### Chat List Screen

- Displays all available chat threads
- **New Thread**: Button to create conversations with multiple users
- **Thread Navigation**: Tap any thread to open the chat detail screen
- **Real-time Updates**: Automatically update the list when threads are updated or created

### Chat Screen

- **Messaging**: Send text messages and photos to thread participants
- **Auto-response**: Simulates dummy responses when users send messages
- **Multi-user Support**: Communicate with all thread participants

### Webpage Screen

- Displays an embedded web view of the Angular-based web application
