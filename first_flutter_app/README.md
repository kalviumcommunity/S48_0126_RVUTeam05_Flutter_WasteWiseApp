# Flutter Environment Setup and First App Run

## 📝 Project Overview

This milestone focuses on establishing a complete mobile development environment. I have successfully installed the Flutter SDK, configured Android Studio, and verified the setup by running the app on a mobile emulator.

## 🛠️ Steps Followed

### 1. Flutter SDK Installation

* **Download:** Downloaded the Flutter SDK for Windows and extracted it to `C:\src\flutter`.
* **PATH Update:** Added the `bin` folder to the System Environment Variables (Path) to enable global terminal commands.
* **Verification:** Ran `flutter doctor` to ensure the toolchain was correctly recognized.

### 2. Android Studio & SDK Configuration

* **Installation:** Installed Android Studio with the "Standard" setup, including the Android SDK and Platform-tools.
* **Plugins:** Installed the Flutter and Dart plugins within Android Studio to support mobile development.
* **Licenses:** Executed `flutter doctor --android-licenses` in the terminal to accept all necessary SDK agreements.

### 3. Emulator Setup

* **Device Creation:** Used the **Virtual Device Manager** to create a Pixel 6 device.
* **System Image:** Downloaded and installed the **Android 14 (API 34)** system image.
* **Connection:** Verified device detection by running `flutter devices` while the emulator was active.

---

## 📸 Setup Verification

### Flutter Doctor Output

> *[Insert your screenshot here showing all green checkmarks in the terminal]*

### Running App on Emulator

>

---

## 💭 Reflection

**What challenges did you face during installation?**
*(Example: "The main challenge was resolving the Android license issue, which required running a specific terminal command. I also had to enable Hardware Virtualization in my BIOS to get the emulator to run smoothly.")*

**How does this setup prepare you for building and testing real mobile apps?**
*(Example: "This setup allows me to test mobile-specific UI elements like the BottomNavigationBar and touch gestures in a realistic environment. It bridges the gap between web development and true mobile engineering.")*

---

# Sprint #2 Milestone: Stateless & Stateful Widgets

## ✅ Project Title
Stateless & Stateful Widgets Demo

## 🧠 Short Description
This milestone demonstrates the two core Flutter widget types: `StatelessWidget` for static UI and `StatefulWidget` for interactive UI. The demo combines a static header with an interactive counter, text style toggle, color changes, and dark mode to show how state drives UI updates.

## 📌 What are Stateless and Stateful Widgets?

**StatelessWidget**
- Immutable; does not store mutable state.
- UI does not change unless the parent rebuilds it with new parameters.
- Best for static UI components like labels and titles.

**StatefulWidget**
- Maintains internal mutable state.
- UI updates dynamically through `setState()`.
- Best for interactive elements like counters, toggles, or forms.

## 🧩 Code Snippets

### StatelessWidget Example
```dart
class GreetingWidget extends StatelessWidget {
	final String name;

	const GreetingWidget({required this.name});

	@override
	Widget build(BuildContext context) {
		return Text('Hello, $name!');
	}
}
```

### StatefulWidget Example
```dart
class CounterWidget extends StatefulWidget {
	@override
	_CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
	int count = 0;

	void increment() {
		setState(() {
			count++;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Column(
			mainAxisAlignment: MainAxisAlignment.center,
			children: [
				Text('Count: $count'),
				ElevatedButton(onPressed: increment, child: Text('Increase')),
			],
		);
	}
}
```

## 🖼️ Screenshots
Add screenshots showing:
1. Initial UI state
2. After interaction (counter increment, color change, or dark mode)

> **Placeholders:**
> - Initial state: [Add screenshot]
> - After interaction: [Add screenshot]

## 🎥 Video Script
Use this guide for what to say and show in your 1–2 minute demo:
[VIDEO_SCRIPT_MILESTONE3.md](../VIDEO_SCRIPT_MILESTONE3.md)

## 💭 Reflection

**How do Stateful widgets make Flutter apps dynamic?**
They store mutable state and rebuild only the widgets that depend on that state when `setState()` is called. This enables UI updates in response to user interaction.

**Why is it important to separate static and reactive parts of the UI?**
It improves performance and maintainability. Static components don’t need to rebuild, while reactive components update efficiently when state changes.

## 📂 Demo Source File
The demo screen is implemented here:
[lib/screens/stateless_stateful_demo.dart](lib/screens/stateless_stateful_demo.dart)
