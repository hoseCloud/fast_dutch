import 'package:fast_dutch/screens/new_navigations/navigation_widget.dart';
import 'package:flutter/material.dart';

class ReceiptScreenWidget extends StatelessWidget {
  const ReceiptScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationWidget(
      isEmpty: [].isEmpty,
      filledNavigationWidget: FilledNavigationWidget(
        widgets: const [],
        buttonMsg: 'Add receipt',
        onTapButtonFunc: () {
          print('click!');
        },
      ),
      emptiedNavigationWidget: EmptiedNavigationWidget(
        msg: 'No receipt!',
        buttonMsg: 'Add receipt',
        onTapButtonFunc: () {
          print('click!');
        },
      ),
    );
  }
}
