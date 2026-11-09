import 'package:flutter/material.dart';

void main() {
  runApp(const StudentProgressApp());
}

class StudentProgressApp extends StatelessWidget {
  const StudentProgressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Progress Tracker',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F5FC),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
      ),
      home: const ProgressDashboard(),
    );
  }
}

class ProgressDashboard extends StatefulWidget {
  const ProgressDashboard({super.key});

  @override
  State<ProgressDashboard> createState() => _ProgressDashboardState();
}

class _ProgressDashboardState extends State<ProgressDashboard> {
  // Live demonstration properties.
  double? progressValue = 0.65;
  Color? progressColor = const Color.fromARGB(255, 59, 199, 101);
  double progressHeight = 10.0;

  // Restore the default widget behaviour.
  void resetDemo() {
    setState(() {
      progressValue = null;
      progressColor = null;
      progressHeight = 4.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final percentage = progressValue == null
        ? null
        : (progressValue! * 100).round();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Progress Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFF6F5FC),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello, Student! 👋',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                'Keep learning and track your progress.',
                style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
              ),

              const SizedBox(height: 25),

              _sectionTitle('Overall Course Progress'),
              const SizedBox(height: 12),

              _progressBox(
                title: 'Flutter Development',
                subtitle: 'Your course completion',
                value: 0.75,
                color: const Color.fromARGB(255, 16, 219, 117),
              ),

              const SizedBox(height: 25),

              _sectionTitle('My Assignments'),
              const SizedBox(height: 12),

              _assignment(
                title: 'Flutter UI Design',
                subtitle: 'Completed 8 of 10 tasks',
                value: 0.8,
                color: const Color.fromARGB(255, 175, 76, 76),
              ),

              const SizedBox(height: 14),

              _assignment(
                title: 'Database Project',
                subtitle: 'Completed 5 of 10 tasks',
                value: 0.5,
                color: const Color.fromARGB(255, 214, 17, 139),
              ),

              const SizedBox(height: 14),

              _assignment(
                title: 'Mobile App Development',
                subtitle: 'Completed 3 of 10 tasks',
                value: 0.3,
                color: const Color.fromARGB(255, 117, 75, 197),
              ),

              const SizedBox(height: 30),

              _sectionTitle('Try LinearProgressIndicator'),
              const SizedBox(height: 6),

              Text(
                'Change the properties below and watch the progress bar.',
                style: TextStyle(color: Colors.grey.shade600),
              ),

              const SizedBox(height: 18),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Live Preview',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 22),

                    // Live LinearProgressIndicator.
                    LinearProgressIndicator(
                      value: progressValue,
                      color: progressColor,
                      minHeight: progressHeight,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      percentage == null
                          ? 'Default: Indeterminate progress'
                          : '$percentage% completed',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),

                    const SizedBox(height: 25),

                    // PROPERTY 1: VALUE
                    const Text(
                      '1. Value – Progress percentage',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    Slider(
                      value: progressValue ?? 0.65,
                      min: 0,
                      max: 1,
                      divisions: 10,
                      label: '${((progressValue ?? 0.65) * 100).round()}%',
                      onChanged: (value) {
                        setState(() {
                          progressValue = value;
                        });
                      },
                    ),

                    const Divider(height: 25),

                    // PROPERTY 2: COLOR
                    const Text(
                      '2. Color – Progress bar colour',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 12),

                    Wrap(
                      spacing: 10,
                      runSpacing: 8,
                      children: [
                        _colorButton('Purple', const Color(0xFF6750A4)),
                        _colorButton('Blue', Colors.blue),
                        _colorButton('Green', Colors.green),
                        _colorButton('Orange', Colors.orange),
                      ],
                    ),

                    const Divider(height: 25),

                    // PROPERTY 3: MIN HEIGHT
                    const Text(
                      '3. MinHeight – Bar thickness',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    Slider(
                      value: progressHeight,
                      min: 2,
                      max: 24,
                      divisions: 11,
                      label: '${progressHeight.round()} px',
                      onChanged: (value) {
                        setState(() {
                          progressHeight = value;
                        });
                      },
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: resetDemo,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Reset demo'),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Center(
                child: Text(
                  'Small steps lead to big achievements! 🌟',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Section heading.
  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  // Overall course progress.
  Widget _progressBox({
    required String title,
    required String subtitle,
    required double value,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
          const SizedBox(height: 15),
          LinearProgressIndicator(value: value, color: color, minHeight: 9),
          const SizedBox(height: 8),
          Text('${(value * 100).round()}%'),
        ],
      ),
    );
  }

  // Individual assignment progress.
  Widget _assignment({
    required String title,
    required String subtitle,
    required double value,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
          const SizedBox(height: 13),
          LinearProgressIndicator(value: value, color: color, minHeight: 8),
        ],
      ),
    );
  }

  // Colour selection buttons.
  Widget _colorButton(String name, Color color) {
    final isSelected = progressColor == color;

    return OutlinedButton(
      onPressed: () {
        setState(() {
          progressColor = color;
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? color.withValues(alpha: 0.12) : null,
        side: BorderSide(color: isSelected ? color : Colors.grey.shade300),
      ),
      child: Text(
        name,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
