# TurboVest

## 1. Angular Web App

to run the angular web app, navigate to the `webpage` directory and run the following command:

```bash
cd webpage
npm install
npm start # or `ng serve --host 0.0.0.0 --port 4201`
```

This will start the angular web app on `http://localhost:4201`

## 2. Flutter Mobile App

to run the flutter mobile app, navigate to the `flutter_app` directory and run the following command:

```bash
cd flutter_app
flutter pub get # to install dependencies
dart run build_runner build --delete-conflicting-outputs # to generate code
flutter run # to run the app
```

Read more about mobile app in [`flutter_app/README.md`](/flutter_app/README.md)
