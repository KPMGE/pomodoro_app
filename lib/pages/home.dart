import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/circular_indicator.dart';
import 'package:pomodoro_app/components/time_select_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
    return Consumer<TimeSelectModel>(builder: (context, timeSelectModel, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pomodoro App'),
        ),
        body: Center(
          child: CircularIndicator(
            initialSeconds: calculateTimeInSeconds(timeSelectModel.time),
          ),
        ),
      );
    });
  }
}
