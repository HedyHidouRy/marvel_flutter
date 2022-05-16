# Marvel

[![License: MIT][license_badge]][license_link]

Marvel Application

---

## Getting Started 🚀

### 1. Install it
After installing flutter
You can install packages from the command line:

with Flutter:

```shell
$ flutter packages get
```

Alternatively, your editor might support `flutter packages get`. Check the docs for your editor to learn more.

### 2. Run it

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```



_\*Marvel works on iOS and Android.


## Architecture

This application was build on top of clean architecture, main 3 layers `domain`, `data` and `presentation`, with the flow that comes with it.

As well as an architectural pattern on the presentation side, using `Bloc` & `Cubit`

## Screenshot

|                                               |                                               |
| :-------------------------------------------: | :-------------------------------------------: |
| <Image src="screenshots/1.png" width ="300"> | <Image src="screenshots/2.png" width ="300">  |
| <Image src="screenshots/3.png" width ="300">  | <Image src="screenshots/4.png" width ="300"> |
| <Image src="screenshots/5.png" width ="300">  | 