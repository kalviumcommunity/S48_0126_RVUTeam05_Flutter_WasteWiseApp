import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/second_screen.dart';
import 'screens/stateless_stateful_demo.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget of the application
/// This is a StatelessWidget that configures the app with named routes
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Screen Navigation Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // Define the initial route (starting screen)
      initialRoute: '/',
      // Define named routes
      routes: {
        '/': (context) => const HomeScreen(),
        '/second': (context) => const SecondScreen(),
        '/stateless-stateful': (context) => const StatelessStatefulDemoPage(),
      },
    );
  }
}
