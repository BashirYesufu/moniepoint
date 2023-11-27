import 'package:flutter/material.dart';

class LandingTab extends StatefulWidget {
  const LandingTab({super.key});
  static const routeName = "/landing";

  @override
  State<LandingTab> createState() => _LandingTabState();
}

class _LandingTabState extends State<LandingTab> {
  List<Widget> tabList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Calculate',
            icon: Icon(Icons.calculate),
          ),
        ],
      ),
    );
  }
}
