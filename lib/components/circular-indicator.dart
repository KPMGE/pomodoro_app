import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pomodoro_app/components/play-pause-button.dart';

class CircularIndicator extends StatefulWidget {
  final int initialHours, initialMinutes, initialSeconds;

  const CircularIndicator({
    super.key,
    required this.initialHours,
    required this.initialMinutes,
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

  double calculatePercentage(double total, double value) {
    return value / total;
  }

  // TODO: Refactor these doubles to ints, and create some helper methods
  double calculateCurrentValue(
      String remainSeconds, String remainMinutes, String remainHours) {
    final hoursInSeconds = double.parse(remainHours) * 3600;
    final minutesInSeconds = double.parse(remainMinutes) * 60;
    return double.parse(remainSeconds) + hoursInSeconds + minutesInSeconds;
  }

  @override
  Widget build(BuildContext context) {
    final double hoursInSeconds = super.widget.initialHours * 3600;
    final double minutesInSeconds = super.widget.initialMinutes * 60;
    final double totalSeconds =
        super.widget.initialSeconds + minutesInSeconds + hoursInSeconds;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTimer(
          begin: Duration(
            hours: super.widget.initialHours,
            minutes: super.widget.initialMinutes,
            seconds: super.widget.initialSeconds,
          ),
          end: const Duration(),
          controller: _controller,
          builder: (remaining) {
            return CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 13.0,
              animation: false,
              percent: calculatePercentage(
                  totalSeconds,
                  calculateCurrentValue(
                    remaining.seconds,
                    remaining.minutes,
                    remaining.hours,
                  )),
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
