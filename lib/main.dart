import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/navbar.dart';
import 'package:pomodoro_app/components/time_select_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TimeSelectModel(),
    child: const PomodoroApp(),
  ));
}

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavBar();
  }
}
