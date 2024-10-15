# flutter_dart_define_demo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.




###

The main advantage of using --dart-define is that we're no longer hardcoding sensitive keys in the source code.
dart-define provides a way to add the secrets to artifacts at build time so they do not need to be part of the source code.

--release
--flavor=staging
--dart-define=app.flavor=staging
--dart-define-from-file="values.json"
--dart-define-from-file=".env"
--dart-define=SOME_VAR=SOME_VALUE
--dart-define=DEBUG=true


To fetch Url value from file

Note: --dart-define-from-file supports both .env and json files

For example:

- Create json file 
- add --dart-define-from-file="values.json"  into additional run args in edit configuration section

- Create .env file
- add --dart-define-from-file=".env"  into additional run args in edit configuration section

To add flavor using dart define

For example:

- add --flavor=staging --dart-define=app.flavor=staging  into additional run args in edit configuration section

To store some value in dart define
--dart-define=SOME_VAR=SOME_VALUE

To fetch values using .env and obfuscation
reference article
https://codewithandrea.com/articles/flutter-api-keys-dart-define-env-files/
https://pub.dev/packages/envied

dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs

apk reverse engineering 

For example:

flutter build apk --dart-define=SECRET_KEY=SEKRET --flavor=staging
cd build/app/outputs/flutter-apk/
mkdir app
cd app
unzip ../app-release.apk
cd build/app/outputs/flutter-apk/app/lib/x86_64



strings libapp.so | grep init
or
strings libapp.so | grep token
or
grep SEKRET libapp.so

or for example
grep services libapp.so
output: Binary file libapp.so matches

or
strings libapp.so | grep init

"services" is the term we are searching for 

reference : https://stackoverflow.com/questions/69346395/are-compile-time-variables-secure-in-flutter/69349448#69349448




Alternate
- place keys on server , fetch on runtime
