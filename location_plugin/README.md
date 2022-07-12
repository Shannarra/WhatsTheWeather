# location_plugin

A location plugin for our course project.
Gets the current location based on different providers.

## Getting Started

The project is created with Flutter Version [2.10.4](https://docs.flutter.dev/development/tools/sdk/releases)
The supported platforms are Android and IOS:
1. Clone the project.
1. Run ```flutter clean```.
1. Run ```flutter pub get```.



Reference the plugin in a Flutter application of you choice by adding it this entry to the [pubspec.yaml](pubspec.yaml)

```yaml
  location_plugin:
    path: [path to the plugin relative to the project for example(./location_plugin)]
```

## Usage
 Import it 
 ```dart
import 'package:location_plugin/location_plugin.dart';
```
 Use it
 ```dart
 final result = await LocationPlugin.getCurrentLocation();
```
