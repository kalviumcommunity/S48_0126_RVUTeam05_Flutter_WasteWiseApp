# Sprint #2 Milestone: Multi-Screen Navigation Using Navigator and Routes

## Project Title
Multi-Screen Navigation with Named Routes

## Short Description
This milestone demonstrates how to build multi-screen Flutter apps using the Navigator class and named routes. You'll learn to create multiple screens, define routes in main.dart, and navigate between screens using `Navigator.pushNamed()` and `Navigator.pop()`.

---

## Steps Performed

### 1) Created Two Screens
- **Home Screen** (`lib/screens/home_screen.dart`): Displays a welcome message with a button to navigate to the second screen
- **Second Screen** (`lib/screens/second_screen.dart`): Shows arrival message with a button to return to home

### 2) Defined Routes in main.dart
- Set `initialRoute: '/'` to start at Home Screen
- Created `routes` map connecting route names to widgets:
  - `'/'` → `HomeScreen()`
  - `'/'` → `SecondScreen()`

### 3) Implemented Navigation
- **Forward**: `Navigator.pushNamed(context, '/second')` pushes the new screen onto the stack
- **Backward**: `Navigator.pop(context)` removes the current screen and returns to the previous one

---

## Code Snippets

### main.dart - Routes Configuration
```dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/second_screen.dart';

void main() {
  runApp(const MyApp());
}

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
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/second': (context) => const SecondScreen(),
      },
    );
  }
}
```

### home_screen.dart - Navigate Forward
```dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: const Text('Go to Second Screen'),
        ),
      ),
    );
  }
}
```

### second_screen.dart - Navigate Backward
```dart
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}
```

---

## What to Say in the Video (1–2 minutes)

### Intro (0:00–0:15)
- "In this demo, I'll show how to build multi-screen apps in Flutter using the Navigator class and named routes."

### App Structure (0:15–0:35)
- "I've defined routes in main.dart using a routes map. The initialRoute tells Flutter which screen to show first."

### Navigation Forward (0:35–1:05)
- "I press the button to navigate to the second screen. Navigator.pushNamed() pushes it onto the navigation stack."

### Navigation Backward (1:05–1:35)
- "I press the back button and Navigator.pop() removes the current screen, returning to home."

### Wrap-up (1:35–2:00)
- "Named routes make apps scalable and maintainable. This pattern is essential for real-world Flutter apps."

---

## Screenshots to Capture
- Home Screen with navigation button
- Second Screen after navigation
- Navigation transition (before and after states)

---

## Reflection Questions

**How does Navigator manage the app's stack of screens?**
Navigator maintains a stack of screens. When you use pushNamed(), a new screen is added to the top of the stack. When you pop(), the top screen is removed, revealing the one below. This stack-based approach allows users to navigate back through their history.

**What are the benefits of using named routes in larger applications?**
Named routes are scalable and maintainable. All routes are defined in one place (main.dart), making them easy to manage. Route names are strings, allowing dynamic navigation. They support passing arguments between screens. Teams can easily add new screens without modifying existing code.

**How can teams structure multi-screen apps for better organization?**
Teams should place each screen in its own file in the `lib/screens/` folder. Define all routes centrally in main.dart. Use consistent naming conventions (e.g., `screen_name.dart` for files, `'/screen-name'` for routes). Document the navigation flow in the README.

---

## Demo Source Files
- [lib/screens/home_screen.dart](lib/screens/home_screen.dart)
- [lib/screens/second_screen.dart](lib/screens/second_screen.dart)
- [lib/main.dart](lib/main.dart)

---

## Video Script
Use the detailed script here:
[VIDEO_SCRIPT_MILESTONE.md](VIDEO_SCRIPT_MILESTONE.md)

