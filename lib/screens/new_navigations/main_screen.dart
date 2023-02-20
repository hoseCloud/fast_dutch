import 'package:fast_dutch/screens/new_navigations/group_screen_widget.dart';
import 'package:fast_dutch/screens/new_navigations/home_screen_widget.dart';
import 'package:fast_dutch/screens/new_navigations/member_screen_widget.dart';
import 'package:fast_dutch/screens/new_navigations/receipt_screen_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final List<BottomNavigationBarItem> navigationItems = const [
    BottomNavigationBarItem(
      label: 'home',
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: 'group',
      icon: Icon(Icons.group),
    ),
    BottomNavigationBarItem(
      label: 'member',
      icon: Icon(Icons.person),
    ),
    BottomNavigationBarItem(
      label: 'receipt',
      icon: Icon(Icons.receipt_long),
    ),
  ];
  final List<Widget> navigationBody = const [
    HomeScreenWidget(),
    GroupScreenWidget(),
    MemberScreenWidget(),
    ReceiptScreenWidget(),
  ];

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.navigationItems.elementAt(selectedIndex).label!),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        useLegacyColorScheme: false,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: widget.navigationItems,
      ),
      body: widget.navigationBody.elementAt(selectedIndex),
    );
  }
}
