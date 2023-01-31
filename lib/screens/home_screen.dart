import 'package:fast_dutch/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onTapAddReciept() {
    print('hi');
  }

  void onTapAddGroup() {
    print('hi');
  }

  @override
  Widget build(BuildContext context) {
    return Navigation(
      emptyMsg: 'No choose group!',
      emptyButtonMsg: 'Choose group',
      addButtonMsg: 'Add reciept',
      widgets: const [],
      onTapAddFunc: onTapAddReciept,
      onTapEmptyFunc: onTapAddGroup,
    );
  }
}
