# TurboVest Mobile App

## Overview

Mobile app using Hive for local storage and Riverpod for state management.
App will **automatically generate randome message** every 30 seconds to a random chat thread and also **trigger notification**. To change the interval, you can modify the `Timer.periodic` call in the `HiveChatRepo` class(`hive_chat_repo.dart`).

1. **Chat Feature**

- App will allow users to **create** multi-user chat threads
- Users can send **text messages and photos**
- Simulated**real-time updates** for new messages and chat threads (using streams)
- **Auto-response** simulation for demo purposes
- App also allow user to see **chat history**

2. **Webview Feature**

- App will embed a web view to display the Angular-based web application
- Users can navigate between different web pages within the app
- Web view will handle routing and navigation within the embedded web content

3. **Local Notifications**

- user must allow notification in order to receive notifications
- App will send local notifications for new messages

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
