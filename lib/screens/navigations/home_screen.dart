import 'package:fast_dutch/screens/add_models/add_receipt_screen.dart';
import 'package:fast_dutch/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onTapAddReceipt() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddReceiptScreen(
          group: 'hello',
        ),
      ),
    );
  }

  void onTapAddGroup() {
    print('hi');
  }

  @override
  Widget build(BuildContext context) {
    return Navigation(
      emptyMsg: 'No choose group!',
      emptyButtonMsg: 'Choose group',
      addButtonMsg: 'Add receipt',
      widgets: const [],
      onTapAddFunc: onTapAddReceipt,
      onTapEmptyFunc: onTapAddGroup,
    );
  }
}
