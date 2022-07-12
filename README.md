# flutter_course_2022

Flutter Weather Application for MentorMate Flutter Course

## Features
This is a fully fledged weather mobile application with several features
- Time based (day based) theming and style
- Localizations performed with the help of [fast_i18n](https://pub.dev/packages/fast_i18n)
- Asset generation with the help of [flutter_gen_runner](https://pub.dev/packages/flutter_gen_runner)
- Local storage for important data [isar](https://pub.dev/packages/isar) and settings [rx_shared_preferences](https://pub.dev/packages/rx_shared_preferences)
- In app examples of memory caching and networking [dio](https://pub.dev/packages/dio)
- For dependency injection is used [dio](https://pub.dev/packages/dio)
- Several examples with different state management approaches [bloc](https://pub.dev/packages/bloc), change notifier and services and stateful widget
- Local notifications with the help of [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications)
- Background fetch and headless service [background_fetch](https://pub.dev/packages/background_fetch)
- A location plugin to access platform specific functionality which we developed for the course.

This application is an example for all the core knowledge a developer needs to know in order to 
begin writing Flutter applications by himself. All major topics and skills are covered.

![Splash](/images/splash.png)  ![City](/images/city.png) ![Weather](/images/weather.png) ![Forecast](/images/forecast.png) ![Drawer](/images/drawer.png) ![Seven Day](/images/seven_day.png)

## Getting Started

The project is created with Flutter Version [2.10.4](https://docs.flutter.dev/development/tools/sdk/releases)
The supported platforms are Android and IOS:
1. First clone the [location plugin](https://gitlab.mentormate.bg/mario.gorki/fluttercourselocationplugin) in a directory of your choice.
1. Clone this project next to the [location plugin](https://gitlab.mentormate.bg/mario.gorki/fluttercourselocationplugin).
1. Open the project in editor of your choice.
1. Run ```flutter clean```.
1. Run ```flutter pub get```.
1. To generate the translation and asset files run ```flutter packages pub run build_runner build```.
1. Start the project on a device of your choice.

