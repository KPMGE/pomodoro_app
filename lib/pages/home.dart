import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/circular-indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro app'),
      ),
      body: const Center(
        child: CircularIndicator(
          initialHours: 0,
          initialMinutes: 3,
          initialSeconds: 59,
        ),
      ),
    );
  }
}
