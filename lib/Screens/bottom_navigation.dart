import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:guru/Screens/about.dart';
import 'package:guru/Screens/contact.dart';
import 'package:guru/Screens/home_screen.dart';
import 'package:guru/Screens/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final List<Widget> _navigationItem = [
    const HomeScreen(),
    const About(),
    const Contact(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _navigationItem[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: const Color.fromARGB(255, 1, 61, 58),
        backgroundColor: Colors.transparent,
        color: const Color.fromARGB(255, 1, 61, 58),
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.accessibility,
            color: Colors.white,
          ),
          Icon(
            Icons.phone,
            color: Colors.white,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
