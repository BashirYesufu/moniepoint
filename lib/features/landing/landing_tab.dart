import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint/features/landing/tabs/calculate.dart';
import 'package:moniepoint/features/landing/tabs/home.dart';
import 'package:moniepoint/features/landing/tabs/shipment.dart';
import '../../constants/app_color.dart';

class LandingTab extends StatefulWidget {
  const LandingTab({super.key});
  static const routeName = "/landing";

  @override
  State<LandingTab> createState() => _LandingTabState();
}

class _LandingTabState extends State<LandingTab> {
  int selectedIndex = 0;

  List<Widget> tabList = [
    Home(),
    Calculate(),
    Shipment(),
    Scaffold()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          _buildBar(index: 0, icon: Icons.home, text: 'Home'),
          _buildBar(index: 1, icon: Icons.calculate, text: 'Calculate'),
          _buildBar(index: 2, icon: Icons.history, text: 'Shipment'),
          _buildBar(index: 3, icon: Icons.person, text: 'Profile'),
        ],
      ),
    );
  }

  _buildBar({required int index, required IconData icon, required String text}){
    return BottomNavigationBarItem(
      label: '',
      icon: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            color: selectedIndex == index ? Theme.of(context).primaryColor : null,
            height: 5.h,
          ),
          Icon(icon, color: selectedIndex == index ? Theme.of(context).primaryColor : AppColor.grey5,),
          Text(text, style: TextStyle(
            color: selectedIndex == index ? Theme.of(context).primaryColor : AppColor.grey5,
          ),)
        ],
      ),
    );

  }
}
