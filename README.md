# Habitar
<a href="https://github.com/Vader-Femi/Habitar/" target="_blank"
rel="nofollow noopener noreferrer" aria-label="Live Demo"><u>Live Demo 🚀(Coming soon)</u></a>

A habit-tracking app using Flutter, configured with [Bloc], [Hydrated Bloc], and [Flutter Super] for a robust and dynamic state management. 
Applied clean architecture principles to ensure a clear separation of features. 
Leveraged Firebase for [authentication], [cloud storage], and [crashlytics], enabling secure, scalable, and debuggable access.
Also integrated [drift] as local database to enable offline access  
Incorporated push notifications with [flutter_local_notifications] to remind users of their goals based on customized parameters, promoting habit consistency across Android and iOS platforms.

[BLoC]: https://pub.dev/packages/flutter_bloc
[Hydrated Bloc]: https://pub.dev/packages/hydrated_bloc
[Flutter Super]: https://pub.dev/documentation/flutter_super/latest/
[authentication]: https://pub.dev/packages/firebase_auth/
[cloud storage]: https://pub.dev/packages/cloud_firestore/
[crashlytics]: https://pub.dev/packages/firebase_crashlytics/
[drift]: https://pub.dev/packages/drift/
[flutter_local_notifications]: https://pub.dev/packages/flutter_local_notifications/

<br />
<div>
  &emsp;&emsp;&emsp;
  <img src="assets/images/app_light_mode.png" alt="Light theme" width="330">
  &emsp;&emsp;&emsp;&emsp;
  <img src="assets/images/app_dark_mode.png" alt="Dark theme" width="320">  
</div>
<br />

# First Run

After installing the package dependencies with

```
flutter pub get
```

run the code generation tool

```
flutter pub run build_runner build
```

### ApiService

Abstraction over the firebase communication that defines (all) firebase functions.
Network functions return DataSuccess or DataFailed which are implementations of the abstract [DataState] class

- [AuthService] - Firebase Auth related functions
- [HomeService] - Habit and Firebase Firestore related functions
- [DataState] - An abstract class of Generic type that contains the network response or error

[AuthService]: lib/features/auth/data/sources/auth_service.dart
[HomeService]: lib/features/home/data/sources/home_service.dart
[DataState]: lib/core/res/data_state.dart/sources/home_service.dart

## Dependency Management

Dependencies are managed in the [`service_locator.dart`][service_locator] file. This sample uses [GetIt], a lightweight service locator.

[service_locator]: ./lib/service_locator.dart
[GetIt]: https://pub.dev/packages/get_it


## Features
This app has 2 feature [Auth] and [Home]...TBD

[Auth]: lib/features/auth
[Home]: lib/features/home

## Logger

This project uses firebase [crashlytics] to log error and crashes
