import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/circular-indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro App'),
      ),
      body: const Center(
        child: CircularIndicator(
          initialSeconds: 257,
        ),
      ),
    );
  }
}
