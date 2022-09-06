import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pomodoro_app/components/play-pause-button.dart';

class CircularIndicator extends StatefulWidget {
  final int initialSeconds;

  const CircularIndicator({
    super.key,
    required this.initialSeconds,
  });

  @override
  State<CircularIndicator> createState() => _CircularIndicatorState();
}

class _CircularIndicatorState extends State<CircularIndicator> {
  final CustomTimerController _controller = CustomTimerController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double calculatePercentage(int total, int value) {
    return value / total;
  }

  int calculateCurrentSeconds(
      String hoursStr, String minutesStr, String seconds) {
    final int hoursInSeconds = int.parse(hoursStr) * 3600;
    final int minutesInSeconds = int.parse(minutesStr) * 60;
    return hoursInSeconds + minutesInSeconds + int.parse(seconds);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTimer(
          begin: Duration(seconds: super.widget.initialSeconds),
          end: const Duration(),
          controller: _controller,
          builder: (remaining) {
            return CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 13.0,
              animation: false,
              percent: calculatePercentage(
                  super.widget.initialSeconds,
                  calculateCurrentSeconds(
                      remaining.hours, remaining.minutes, remaining.seconds)),
              center: Text(
                "${remaining.hours} : ${remaining.minutes} : ${remaining.seconds}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.purple,
            );
          },
        ),
        const SizedBox(height: 10),
        PlayPauseButton(
          onPause: () => _controller.pause(),
          onPlay: () => _controller.start(),
        )
      ],
    );
  }
}
