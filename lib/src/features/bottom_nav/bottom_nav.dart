import 'package:flutter/material.dart';
import 'package:quiz_app/src/features/category/view/category_screen.dart';
import 'package:quiz_app/src/features/home/view/home_screen.dart';
import 'package:quiz_app/src/features/notification/view/notification_screen.dart';

import '../../core/constants/app_color.dart';
import '../../core/utilities/size-config.dart';
import '../menu/view/menue_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  final screens = [
    const HomeScreen(),
    const NotificationScreen(),
    const CategoryScreen(),
    const MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColor.iconColor,
          unselectedItemColor: AppColor.skyBgColor,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_none_outlined,
                size: SizeConfig.safeBlockHorizontal! * 5,
              ),
              label: "Notification",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.category_outlined,
              ),
              label: "Category",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.menu_open_sharp),
              label: "Menu",
            ),
          ]),
    );
  }

  homeTabText(text, fontSize, fontWeight, color) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'inter',
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color),
    );
  }
}
