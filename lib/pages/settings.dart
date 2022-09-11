import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final void Function(double) onChangeTimer;

  const SettingsPage({
    super.key,
    required this.onChangeTimer,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
              '${_value.toStringAsFixed(2)} min',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            )),
          ),
          Slider(
            min: 0.0,
            max: 60.0,
            value: _value,
            onChanged: (value) {
              super.widget.onChangeTimer(value);
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
