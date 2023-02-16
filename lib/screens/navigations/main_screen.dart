import 'package:fast_dutch/screens/navigations/group_screen.dart';
import 'package:fast_dutch/screens/navigations/home_screen.dart';
import 'package:fast_dutch/screens/navigations/member_screen.dart';
import 'package:fast_dutch/screens/navigations/receipt_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  final bodyWidgets = [
    const HomeScreen(),
    const GroupScreen(),
    const MemberScreen(),
    const ReceiptScreen(),
  ];

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hello'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        useLegacyColorScheme: false,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
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
        ],
      ),
      body: widget.bodyWidgets.elementAt(currentIndex),
    );
  }
}
