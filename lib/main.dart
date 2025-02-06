import 'package:flutter/material.dart';

import 'env.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Dart Define Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Dart Define Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// m1
  static const backendUrl =
      String.fromEnvironment('backend_url', defaultValue: 'SOME_DEFAULT_VALUE');

  ///m2
  // static const backendUrl =
  // String.fromEnvironment('backend_url');
  //
  // if (backend_url.isEmpty) {
  // throw AssertionError('backend_url is not set');
  // }

  static const String flavor = String.fromEnvironment('app.flavor');

  static const SOME_VAR =
      String.fromEnvironment('SOME_VAR', defaultValue: 'SOME_DEFAULT_VALUE');
  static const token =
      String.fromEnvironment('TOKEN', defaultValue: 'SOME_DEFAULT_VALUE');

  void log(String message) {
    // Log the debug message if the environment declaration 'DEBUG' is `true`.
    // If there was no value specified, do not log.
    if (const bool.fromEnvironment('DEBUG', defaultValue: false)) {
      print('debug: $message');
    }
  }

  @override
  void initState() {
    log('debug mode value is true');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
 //   Env obj = Env();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              const Text(
                '1) URL value from json file',
              ),
              Text(
                backendUrl,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '2) fetch flavor value',
              ),
              Text(
                flavor,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '3) store some value',
              ),
              Text(
                SOME_VAR,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '4) token value from .env file',
              ),
              Text(
                token,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '5) token value using .env file and obfuscation',
              ),
              // Text(
              //   obj.token,
              //   style: Theme.of(context).textTheme.headlineMedium,
              // ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
