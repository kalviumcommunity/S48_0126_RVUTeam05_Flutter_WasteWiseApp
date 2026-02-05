# VIDEO SCRIPT: Multi-Screen Navigation Using Navigator and Routes
**Duration**: 1–2 minutes  
**Platform**: Loom, Google Drive, or YouTube (unlisted)

---

## 📹 Video Structure & Talking Points

### INTRO SECTION (0:00 - 0:15)
**What to Show on Screen:**
- Running Flutter app showing Home Screen
- VS Code showing main.dart with routes definition

**What to Say:**
> "In this demo, I'll demonstrate multi-screen navigation in Flutter. I'll show how to use the Navigator class with named routes to move between different screens smoothly. This is essential for building real-world apps with multiple pages."

---

### SECTION 1: App Structure & Routes (0:15 - 0:35)
**What to Show on Screen:**
- Open main.dart in VS Code
- Show the routes map definition
- Show initialRoute and routes setup

**What to Say:**
> "First, I've set up the app structure using named routes. In main.dart, I defined a routes map that connects route names like '/' for Home and '/second' for the second screen. This makes navigation predictable and scalable. The initialRoute tells Flutter which screen to show when the app starts."

**Key Points:**
- Named routes provide clear navigation paths
- Routes map connects screen names to widgets
- initialRoute defines the starting screen
- Easy to add new screens later

---

### SECTION 2: Navigating Forward (0:35 - 1:05)
**What to Show on Screen:**
- Show Home Screen in the app
- Click the "Go to Second Screen" button
- Show the transition to Second Screen

**What to Say:**
> "Now I'll navigate forward to the second screen. I press the button that calls Navigator.pushNamed(context, '/second'). The app smoothly transitions to the second screen. The Navigator manages the stack of screens, so we can go back whenever we want."

**Key Points:**
- Navigator.pushNamed() pushes a new screen onto the stack
- Smooth transition animation
- Previous screen remains in memory
- Can pass arguments between screens

---
Navigating Backward (1:05 - 1:40)
**What to Show on Screen:**
- Show Second Screen
- Click the "Back to Home" button
- Show the transition back to Home Screen

**What to Say:**
> "Now I'll go back to the home screen by pressing the back button. Navigator.pop(context) removes the current screen from the stack and returns to the previous one. This manages the navigation stack automatically, so users always know how to navigate backward."

**Key Points:**
- Navigator.pop() returns to the previous screen
- Navigation stack is managed automatically
- Back button works as expected
- State management remains consistent
- Memory & Network tabs for deeper insights

---

### WRAP-UP (1:40 - 2:00)
**What to Show on Screen:**
- Both screens visible in sequence
- main.dart showing routes definition

**What to Say:**
> "Using Navigator with named routes makes multi-screen apps clean, maintainable, and scalable. As your app grows, you can easily add more screens to the routes map. This pattern is used in professional Flutter apps and is essential for building complex UIs."

---

##Home Screen with "Go to Second Screen" button
- Second Screen showing the navigation destination
- Navigation transition in action (before/after)

---

## ✅ Recording Checklist
- [ ] App running on emulator or device
- [ ] Home Screen displayed clearly
- [ ] Navigation forward demonstrated (pushNamed)
- [ ] Navigation backward demonstrated (pop)
- [ ] Clear audio and smooth transitions
- [ ] Code snippets visible (main.dart routes map)

---

**Status**: ✅ Script Updated for Multi-Screen Navigation
**Status**: ✅ Script Updated for Hot Reload, Debug Console, and DevTools
