import 'package:fast_dutch/screens/add_models/add_receipt_screen.dart';
import 'package:fast_dutch/screens/navigations/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';

class ReceiptScreenWidget extends StatelessWidget {
  const ReceiptScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void onTapAddButton() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddReceiptScreen()),
      );
    }

    return NavigationWidget(
      isEmpty: [].isEmpty,
      filledNavigationWidget: FilledNavigationWidget(
        widgets: const [],
        buttonMsg: 'Add receipt',
        onTapButtonFunc: onTapAddButton,
      ),
      emptiedNavigationWidget: EmptiedNavigationWidget(
        msg: 'No receipt!',
        buttonMsg: 'Add receipt',
        onTapButtonFunc: onTapAddButton,
      ),
    );
  }
}
