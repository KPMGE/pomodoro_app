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
    int minutes = value.abs().toInt();
    // given the seconds, shift them 2 positions, multiplying by 100,
    // then take the rounded value
    int seconds = ((value - minutes) * 100).round();
    int minutesInSeconds = minutes * 60;

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
