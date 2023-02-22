import 'package:fast_dutch/screens/new_navigations/navigation_widget.dart';
import 'package:flutter/material.dart';

class GroupScreenWidget extends StatelessWidget {
  const GroupScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationWidget(
      isEmpty: [].isEmpty,
      filledNavigationWidget: FilledNavigationWidget(
        widgets: const [],
        buttonMsg: 'Add Group',
        onTapButtonFunc: () {
          print('click!');
        },
      ),
      emptiedNavigationWidget: EmptiedNavigationWidget(
        msg: 'No group!',
        buttonMsg: 'Add group',
        onTapButtonFunc: () {
          print('click!');
        },
      ),
    );
  }
}
