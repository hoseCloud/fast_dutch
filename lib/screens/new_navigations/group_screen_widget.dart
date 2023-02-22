import 'package:fast_dutch/screens/new_add_models/add_group_screen.dart';
import 'package:fast_dutch/screens/new_navigations/navigation_widget.dart';
import 'package:flutter/material.dart';

class GroupScreenWidget extends StatelessWidget {
  const GroupScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void onTapAddButton() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddGroupScreen()),
      );
    }

    return NavigationWidget(
      isEmpty: [].isEmpty,
      filledNavigationWidget: FilledNavigationWidget(
        widgets: const [],
        buttonMsg: 'Add Group',
        onTapButtonFunc: onTapAddButton,
      ),
      emptiedNavigationWidget: EmptiedNavigationWidget(
        msg: 'No group!',
        buttonMsg: 'Add group',
        onTapButtonFunc: onTapAddButton,
      ),
    );
  }
}
