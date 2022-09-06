import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/navbar.dart';

void main() {
  runApp(const PomodoroApp());
}

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavBar();
  }
}
