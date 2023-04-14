import 'package:flutter/material.dart';
import 'package:uic_test/features/counties/presentation/screen/countries_screen.dart';

import '../space_x/presentation/screen/spacex_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: index == 0 ? const SpaceXScreen() : CountriesScreen(),
      bottomNavigationBar: getBottomNavigation(),
    );
  }

  getBottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      onTap: onTap,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.black,
      iconSize: 20,
      items: [
        getBotNavBarItem('SpaceX'),
        getBotNavBarItem('Countries'),
      ],
    );
  }

  getBotNavBarItem(String str) {
    return BottomNavigationBarItem(
      icon: const SizedBox(),
      label: str,
    );
  }


  onTap(int pressed) {
    setState(() {
      index = pressed;
    });
  }
}