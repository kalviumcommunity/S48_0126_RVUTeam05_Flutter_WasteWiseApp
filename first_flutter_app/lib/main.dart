import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget of the application - Stateless widget
/// This is the entry point that builds the entire widget tree
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Tree & Reactive UI Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ReactiveUIDemoPage(),
    );
  }
}

/// Stateful widget that demonstrates the reactive UI model
/// This widget manages state and rebuilds when state changes
class ReactiveUIDemoPage extends StatefulWidget {
  const ReactiveUIDemoPage({super.key});

  @override
  State<ReactiveUIDemoPage> createState() => _ReactiveUIDemoPageState();
}

/// State class that manages the reactive behavior
class _ReactiveUIDemoPageState extends State<ReactiveUIDemoPage> {
  // State variables that trigger rebuilds when changed
  int _counter = 0;
  bool _isDarkMode = false;
  bool _showExtraInfo = false;
  String _userFeedback = 'Click buttons to see reactive updates!';

  /// This method triggers a rebuild of the widget tree
  /// Flutter rebuilds only the widgets affected by state changes
  void _incrementCounter() {
    setState(() {
      _counter++;
      _userFeedback = 'Counter incremented to $_counter';
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
      _userFeedback = 'Counter decremented to $_counter';
    });
  }

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      _userFeedback = 'Theme changed to ${_isDarkMode ? 'dark' : 'light'} mode';
    });
  }

  void _toggleExtraInfo() {
    setState(() {
      _showExtraInfo = !_showExtraInfo;
      _userFeedback = _showExtraInfo ? 'Extra info is now visible' : 'Extra info is hidden';
    });
  }

  void _resetApp() {
    setState(() {
      _counter = 0;
      _isDarkMode = false;
      _showExtraInfo = false;
      _userFeedback = 'App reset! All values returned to default.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Tree & Reactive UI'),
        centerTitle: true,
        backgroundColor: _isDarkMode ? Colors.grey[900] : null,
        elevation: 4,
      ),
      body: Container(
        color: _isDarkMode ? Colors.grey[850] : Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Section
                _buildHeaderSection(),
                const SizedBox(height: 24),

                // Counter Display Section
                _buildCounterSection(),
                const SizedBox(height: 24),

                // Feedback Section (Reactive to state changes)
                _buildFeedbackSection(),
                const SizedBox(height: 24),

                // Control Buttons Section
                _buildControlButtonsSection(),
                const SizedBox(height: 24),

                // Conditional Widget (Shows/hides based on state)
                if (_showExtraInfo) _buildExtraInfoSection(),

                const SizedBox(height: 24),

                // Reset Button
                _buildResetButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the header section of the app
  Widget _buildHeaderSection() {
    return Card(
      elevation: 2,
      color: _isDarkMode ? Colors.grey[800] : Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🌳 Widget Tree Demonstration',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: _isDarkMode ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Every button click triggers setState(), which rebuilds affected parts of the widget tree.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: _isDarkMode ? Colors.grey[300] : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the counter display section
  Widget _buildCounterSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.teal.withOpacity(0.8),
            Colors.cyan.withOpacity(0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            'Interactive Counter',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
              ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$_counter',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '(State changes trigger widget rebuilds)',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.white70,
              ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Builds the feedback section that reacts to state changes
  Widget _buildFeedbackSection() {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.teal,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
          color: _isDarkMode ? Colors.grey[800] : Colors.teal[50],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reactive Feedback:',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: _isDarkMode ? Colors.white : Colors.teal[900],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _userFeedback,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: _isDarkMode ? Colors.grey[200] : Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the control buttons section
  Widget _buildControlButtonsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionButton(
              label: 'Increment',
              icon: Icons.add,
              onPressed: _incrementCounter,
              color: Colors.green,
            ),
            _buildActionButton(
              label: 'Decrement',
              icon: Icons.remove,
              onPressed: _decrementCounter,
              color: Colors.red,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionButton(
              label: _isDarkMode ? 'Light' : 'Dark',
              icon: _isDarkMode ? Icons.light_mode : Icons.dark_mode,
              onPressed: _toggleDarkMode,
              color: Colors.purple,
            ),
            _buildActionButton(
              label: _showExtraInfo ? 'Hide Info' : 'Show Info',
              icon: _showExtraInfo ? Icons.visibility_off : Icons.visibility,
              onPressed: _toggleExtraInfo,
              color: Colors.orange,
            ),
          ],
        ),
      ],
    );
  }

  /// Helper method to build action buttons
  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon),
          label: Text(label),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }

  /// Builds the extra info section (conditionally displayed)
  Widget _buildExtraInfoSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _isDarkMode ? Colors.amber[900]?.withOpacity(0.3) : Colors.amber[50],
        border: Border.all(color: Colors.amber, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '📊 Widget Tree Information',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: _isDarkMode ? Colors.amber[200] : Colors.amber[900],
              ),
          ),
          const SizedBox(height: 12),
          _buildInfoRow('Current Counter Value:', '$_counter'),
          _buildInfoRow('Theme Mode:', _isDarkMode ? 'Dark' : 'Light'),
          _buildInfoRow('Display Timestamp:', DateTime.now().toString().split('.')[0]),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '💡 When you click buttons above, only the affected widgets rebuild! '
              'Flutter\'s framework efficiently updates only the parts of the tree that changed.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[800],
                  ),
            ),
          ),
        ],
      ),
    );
  }

  /// Helper to build info rows
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: _isDarkMode ? Colors.grey[300] : Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _isDarkMode ? Colors.amber[200] : Colors.amber[900],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the reset button
  Widget _buildResetButton() {
    return ElevatedButton.icon(
      onPressed: _resetApp,
      icon: const Icon(Icons.refresh),
      label: const Text('Reset All Values'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[600],
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
    );
  }
}
