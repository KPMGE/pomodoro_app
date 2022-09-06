import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:pomodoro_app/pages/home.dart';
import 'package:pomodoro_app/pages/settings.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Home", Colors.purple,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold)),
    TabItem(Icons.settings, "Settings", Colors.teal,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold)),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  Widget bodyContainer() {
    return GestureDetector(
      child: selectedPos == 0 ? const HomePage() : const SettingsPage(),
      onTap: () {
        if (_navigationController.value == tabItems.length - 1) {
          _navigationController.value = 0;
        } else {
          _navigationController.value = _navigationController.value! + 1;
        }
      },
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      backgroundBoxShadow: const <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: const Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro App',
      theme: ThemeData(
        primarySwatch: selectedPos == 0 ? Colors.purple : Colors.teal,
      ),
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: bottomNavBarHeight),
              child: bodyContainer(),
            ),
            Align(alignment: Alignment.bottomCenter, child: bottomNav())
          ],
        ),
      ),
    );
  }
}
