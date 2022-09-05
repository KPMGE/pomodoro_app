import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/circular-indicator.dart';
import 'package:pomodoro_app/components/play-pause-button.dart';

void main() {
  runApp(const PomodoroApp());
}

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro app',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pomodoro app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularIndicator(percentage: 70.343423),
            SizedBox(height: 10),
            PlayPauseButton()
          ],
        ),
      ),
    );
  }
}
