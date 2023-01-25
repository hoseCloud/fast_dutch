import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final bodyWidgets = [
    const Text('home'),
    const Text('group'),
    const Text('member'),
    const Text('reciept'),
  ];

  MainScreen({super.key});

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
            label: 'reciept',
            icon: Icon(Icons.receipt_long),
          ),
        ],
      ),
      body: Center(
        child: widget.bodyWidgets.elementAt(currentIndex),
      ),
    );
  }
}
