import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // SfRangeValues _values = const SfRangeValues(0, 60);

  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.75),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Center(
                child: Text(
              _value.toStringAsFixed(2),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            )),
          ),
          Slider(
            min: 0.0,
            max: 60.0,
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
