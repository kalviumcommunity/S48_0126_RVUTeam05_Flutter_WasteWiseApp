import 'package:flutter/material.dart';

/// Main demo page showing both Stateless and Stateful widgets in action
class StatelessStatefulDemoPage extends StatefulWidget {
  const StatelessStatefulDemoPage({Key? key}) : super(key: key);

  @override
  State<StatelessStatefulDemoPage> createState() =>
      _StatelessStatefulDemoPageState();
}

/// State class managing the interactive elements
/// This demonstrates how StatefulWidget maintains and updates state
class _StatelessStatefulDemoPageState extends State<StatelessStatefulDemoPage> {
  // ============ STATE VARIABLES ============
  // These variables are managed by setState() and trigger rebuilds when changed

  /// Counter that gets incremented/decremented
  int _counter = 0;

  /// Current background color for the counter display
  Color _counterColor = Colors.blue;

  /// Whether the counter value is displayed in bold text
  bool _isBoldText = false;

  /// Whether dark mode is enabled
  bool _isDarkMode = false;

  /// History of counter changes (for feedback)
  String _lastAction = 'App started';

  // ============ STATE UPDATE METHODS ============
  // These methods use setState() to update state and trigger UI rebuild

  /// Increments the counter and updates the last action
  void _incrementCounter() {
    setState(() {
      _counter++;
      _lastAction = 'Incremented to $_counter';
      _updateColorBasedOnCounter();
    });
  }

  /// Decrements the counter and updates the last action
  void _decrementCounter() {
    setState(() {
      _counter--;
      _lastAction = 'Decremented to $_counter';
      _updateColorBasedOnCounter();
    });
  }

  /// Updates the counter color based on its value
  /// Demonstrates how state changes can trigger other state changes
  void _updateColorBasedOnCounter() {
    if (_counter > 10) {
      _counterColor = Colors.green;
    } else if (_counter > 5) {
      _counterColor = Colors.orange;
    } else if (_counter < 0) {
      _counterColor = Colors.red;
    } else {
      _counterColor = Colors.blue;
    }
  }

  /// Toggles whether the counter text is bold
  void _toggleTextStyle() {
    setState(() {
      _isBoldText = !_isBoldText;
      _lastAction = _isBoldText ? 'Text style: Bold' : 'Text style: Normal';
    });
  }

  /// Toggles dark mode on/off
  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      _lastAction = _isDarkMode ? 'Dark mode: ON' : 'Dark mode: OFF';
    });
  }

  /// Resets all values to their initial state
  void _resetCounter() {
    setState(() {
      _counter = 0;
      _counterColor = Colors.blue;
      _isBoldText = false;
      _lastAction = 'Counter reset to 0';
    });
  }

  /// Changes the counter color to a random color
  void _randomizeColor() {
    final colors = [Colors.red, Colors.green, Colors.purple, Colors.orange];
    setState(() {
      _counterColor = colors[_counter % colors.length];
      _lastAction = 'Color randomized!';
    });
  }

  // ============ HELPER METHODS FOR BUILDING UI ============
  // These methods return StatelessWidgets to keep code organized

  /// Builds the static header section (using a StatelessWidget)
  /// This demonstrates a simple stateless widget pattern
  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.blue.shade800],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Stateless & Stateful Widgets',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'This demo shows how both widget types work together',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the counter display section with dynamic background color
  Widget _buildCounterSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: _counterColor.withOpacity(0.2),
        border: Border.all(color: _counterColor, width: 3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Current Count',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Text(
            '$_counter',
            style: TextStyle(
              fontSize: 64,
              fontWeight: _isBoldText ? FontWeight.bold : FontWeight.normal,
              color: _counterColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Color: #${_counterColor.value.toRadixString(16).padLeft(8, '0').toUpperCase()}',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  /// Builds the action buttons section
  Widget _buildButtonsSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionButton(
              label: '−',
              onPressed: _decrementCounter,
              backgroundColor: Colors.red,
            ),
            _buildActionButton(
              label: '+',
              onPressed: _incrementCounter,
              backgroundColor: Colors.green,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionButton(
              label: 'Toggle Text',
              onPressed: _toggleTextStyle,
              backgroundColor: Colors.purple,
              isSmall: true,
            ),
            _buildActionButton(
              label: 'Random Color',
              onPressed: _randomizeColor,
              backgroundColor: Colors.orange,
              isSmall: true,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionButton(
              label: 'Dark Mode',
              onPressed: _toggleDarkMode,
              backgroundColor: Colors.grey,
              isSmall: true,
            ),
            _buildActionButton(
              label: 'Reset',
              onPressed: _resetCounter,
              backgroundColor: Colors.redAccent,
              isSmall: true,
            ),
          ],
        ),
      ],
    );
  }

  /// Reusable button builder
  /// Demonstrates how to create stateless components that are used by stateful parent
  Widget _buildActionButton({
    required String label,
    required VoidCallback onPressed,
    required Color backgroundColor,
    bool isSmall = false,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: isSmall ? 16 : 32,
          vertical: isSmall ? 12 : 16,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  /// Builds the feedback/info section showing last action
  Widget _buildFeedbackSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _isDarkMode ? Colors.grey[900] : Colors.grey[100],
        border: Border.all(
          color: _isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Last Action:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            _lastAction,
            style: TextStyle(
              fontSize: 14,
              color: _isDarkMode ? Colors.grey[300] : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the explanation cards section
  Widget _buildExplanationSection() {
    return Column(
      children: [
        _ExplanationCard(
          title: 'StatelessWidget',
          subtitle: 'No Internal State',
          description:
              'The header at the top is a StatelessWidget. It never changes unless the parent rebuilds it with new data.',
          color: Colors.blue,
        ),
        const SizedBox(height: 12),
        _ExplanationCard(
          title: 'StatefulWidget',
          subtitle: 'Manages State',
          description:
              'This entire page is a StatefulWidget. It maintains state (counter, color, etc.) and rebuilds when setState() is called.',
          color: Colors.green,
        ),
      ],
    );
  }

  // ============ MAIN BUILD METHOD ============

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless & Stateful Demo'),
        elevation: 0,
        backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.blue[600],
      ),
      backgroundColor: _isDarkMode ? Colors.grey[850] : Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ========== STATELESS WIDGET ==========
            // This section remains the same unless parent rebuilds it
            _buildHeaderSection(),
            const SizedBox(height: 24),

            // ========== STATEFUL WIDGET INTERACTIVE AREA ==========
            // Everything below changes based on state

            // Counter display with dynamic color
            _buildCounterSection(),
            const SizedBox(height: 24),

            // Interactive buttons
            _buildButtonsSection(),
            const SizedBox(height: 24),

            // Feedback showing last action
            _buildFeedbackSection(),
            const SizedBox(height: 24),

            // Educational explanation cards
            _buildExplanationSection(),
            const SizedBox(height: 24),

            // Additional info section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.yellow[700]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '💡 Key Insight:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'When you click a button, setState() is called. Flutter then rebuilds only the widgets that depend on the changed state. The header (StatelessWidget) is not rebuilt because it has no dependencies on the state variables.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Counter statistics
            _buildStatsSection(),
          ],
        ),
      ),
    );
  }

  /// Builds a statistics display section
  Widget _buildStatsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _counterColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '📊 Stats:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 12),
          _StatsRow(label: 'Current Value:', value: '$_counter'),
          _StatsRow(label: 'Text Style:', value: _isBoldText ? 'Bold' : 'Normal'),
          _StatsRow(label: 'Theme:', value: _isDarkMode ? 'Dark' : 'Light'),
          _StatsRow(
            label: 'Color Status:',
            value: _counter < 0
                ? 'Negative'
                : _counter == 0
                    ? 'Zero'
                    : _counter <= 5
                        ? 'Low'
                        : _counter <= 10
                            ? 'Medium'
                            : 'High',
          ),
        ],
      ),
    );
  }
}

/// A stateless widget that displays explanation cards
/// This demonstrates best practices: creating reusable stateless components
class _ExplanationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final Color color;

  const _ExplanationCard({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: color.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

/// A stateless widget for displaying stat rows
/// Shows how StatelessWidgets can be composed for reusability
class _StatsRow extends StatelessWidget {
  final String label;
  final String value;

  const _StatsRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.blue[600],
            ),
          ),
        ],
      ),
    );
  }
}
