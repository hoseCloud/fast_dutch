import 'package:fast_dutch/screens/new_add_models/add_member_screen.dart';
import 'package:fast_dutch/screens/new_navigations/navigation_widget.dart';
import 'package:flutter/material.dart';

class MemberScreenWidget extends StatelessWidget {
  const MemberScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void onTapAddButton() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddMemberScreen()),
      );
    }

    return NavigationWidget(
      isEmpty: [].isEmpty,
      filledNavigationWidget: FilledNavigationWidget(
        widgets: const [],
        buttonMsg: 'Add member',
        onTapButtonFunc: onTapAddButton,
      ),
      emptiedNavigationWidget: EmptiedNavigationWidget(
        msg: 'No member!',
        buttonMsg: 'Add member',
        onTapButtonFunc: onTapAddButton,
      ),
    );
  }
}
