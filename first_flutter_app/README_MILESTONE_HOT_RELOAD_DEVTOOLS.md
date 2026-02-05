# Sprint #2 Milestone: Hot Reload, Debug Console & Flutter DevTools

## Project Title
Hot Reload, Debug Console & DevTools Demo

## Short Description
This milestone demonstrates Flutter’s core productivity tools. You will perform a live Hot Reload update, log state changes to the Debug Console with `debugPrint()`, and inspect the widget tree using Flutter DevTools.

---

## Steps Performed

### 1) Hot Reload
- Run the app in debug mode.
- Change a UI text (e.g., **Hot Reload Demo: v1** → **v2**).
- Save the file and press `r` in the terminal.
- Confirm the UI updates immediately without losing state.

### 2) Debug Console
- Press any button in the app (Increment, Decrement, Toggle Text, Dark Mode, Reset).
- Each button logs a message via `debugPrint()`.
- Verify logs appear in the Debug Console.

### 3) Flutter DevTools
- Open DevTools from VS Code (Command Palette → **Open DevTools**).
- Use the Widget Inspector to view the widget tree.
- Optionally open the Performance tab to view frame timings.

---

## What to Say in the Video (1–2 minutes)

### Intro (0:00–0:15)
- “I’ll demonstrate Hot Reload, the Debug Console, and Flutter DevTools.”

### Hot Reload (0:15–0:40)
- “I changed this text and pressed `r`. The UI updated instantly without losing state.”

### Debug Console (0:40–1:05)
- “I pressed a button and the console logged the new state using `debugPrint()`.”

### DevTools (1:05–1:40)
- “I opened DevTools and inspected the widget tree. The Performance tab helps analyze frame times.”

### Wrap-up (1:40–2:00)
- “These tools make Flutter development faster, smarter, and more efficient.”

---

## Screenshots to Capture
- App after Hot Reload update
- Debug Console showing logs
- Flutter DevTools with Widget Inspector or Performance tab

---

## Reflection
**How does Hot Reload improve productivity?**
It applies UI changes instantly without restarting the app, preserving current state.

**Why is DevTools useful for debugging and optimization?**
It provides visual inspection of the widget tree, performance metrics, and memory usage.

**How can teams use these tools together?**
Teams can iterate quickly with Hot Reload, log issues in Debug Console, and diagnose performance with DevTools.

---

## Demo Source File
[lib/screens/stateless_stateful_demo.dart](lib/screens/stateless_stateful_demo.dart)

---

## Video Script
Use the detailed script here:
[VIDEO_SCRIPT_MILESTONE.md](VIDEO_SCRIPT_MILESTONE.md)
