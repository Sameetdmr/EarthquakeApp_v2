# EarthquakeApp

It is a flutter application, Provides access to last minute earthquakes in Turkey!


## Getting Started

- Get an API key at https://cloud.google.com/maps-platform/.

- Enable Google Map SDK for each platform.

- Go to Google Developers Console.
- Choose the project that you want to enable Google Maps on.
- Select the navigation menu and then select "Google Maps".
- Select "APIs" under the Google Maps menu.
- To enable Google Maps for Android, select "Maps SDK for Android" in the "Additional APIs" section, then select "ENABLE".
- Make sure the APIs you enabled are under the "Enabled APIs" section.


- Specify your API key in the application manifest android/app/src/main/AndroidManifest.xml:
```
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="Api-key"/>
```

```
flutter pub get
flutter run
```



## Tech and Libraries

- MVVM Architecture
- State Management with [GetX](https://pub.dev/packages/get)
- Animation [Lottie](https://pub.dev/packages/lottie)
- Analytics & Crashlytics [Firebase](https://firebase.flutter.dev/)
- To view the map [Google Maps](https://pub.dev/packages/google_maps_flutter)

## News API
- [Earthquake API](https://api.orhanaydogdu.com.tr/deprem/live.php?limit=100) 
- I would like to thank [Orhan Aydoğdu](https://github.com/orhanayd) for providing the service.


## Previews


<p float="left">
  <img src="https://user-images.githubusercontent.com/43873156/205680886-754efc0b-3487-4083-bca7-2cc652ae5dab.png" width="200" />
  <img src="https://user-images.githubusercontent.com/43873156/205680982-d07a1469-82a9-4552-9d08-32d83a7ae699.png" width="200" /> 
  <img src="https://user-images.githubusercontent.com/43873156/205681045-ed4fc325-1a98-428c-bb2e-5249135dab9b.png" width="200" />
<img src="https://user-images.githubusercontent.com/43873156/205681143-789bed9f-694f-4535-9e2f-fca5c8093a17.png" width="200" />
</p>



