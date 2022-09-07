import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/circular_indicator.dart';

class HomePage extends StatefulWidget {
  final double initialTimeInMinutes;

  const HomePage({
    super.key,
    required this.initialTimeInMinutes,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int calculateTimeInSeconds(double value) {
    double minutes = value.abs();
    int seconds = (value - minutes).toInt();
    int minutesInSeconds = (minutes * 60.0).toInt();
    return minutesInSeconds + seconds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro App'),
      ),
      body: Center(
        child: CircularIndicator(
          initialSeconds:
              calculateTimeInSeconds(super.widget.initialTimeInMinutes),
        ),
      ),
    );
  }
}
