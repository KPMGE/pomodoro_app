import 'dart:ffi';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';

class CircularIndicator extends StatefulWidget {
  final double percentage;
  const CircularIndicator({super.key, required this.percentage});

  @override
  State<CircularIndicator> createState() => _CircularIndicatorState();
}

class _CircularIndicatorState extends State<CircularIndicator> {
  @override
  Widget build(BuildContext context) {
    final String percentageStr = super.widget.percentage.toStringAsFixed(2);
    final String percentageWithPercentSign = percentageStr + "%";

    return Center(
      child: CircularPercentIndicator(
        radius: 120.0,
        lineWidth: 13.0,
        animation: true,
        percent: 0.7,
        center: Text(
          percentageWithPercentSign,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: Colors.purple,
      ),
    );
  }
}
