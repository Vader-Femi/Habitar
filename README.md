# Habitar

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
  <img src="" alt="Light theme" width="330">
  &emsp;&emsp;&emsp;&emsp;
  <img src="" alt="Dark theme" width="320">  
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

