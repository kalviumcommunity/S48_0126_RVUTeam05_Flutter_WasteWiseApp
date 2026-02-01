import 'package:flutter/material.dart';

import 'screens/stateless_stateful_demo.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget of the application
/// This is a StatelessWidget as it doesn't manage its own state
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless & Stateful Widgets Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const StatelessStatefulDemoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
