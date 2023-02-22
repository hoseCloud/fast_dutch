import 'package:fast_dutch/screens/new_navigations/navigation_widget.dart';
import 'package:flutter/material.dart';

class MemberScreenWidget extends StatelessWidget {
  const MemberScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationWidget(
      isEmpty: [].isEmpty,
      filledNavigationWidget: FilledNavigationWidget(
        widgets: const [],
        buttonMsg: 'Add member',
        onTapButtonFunc: () {
          print('click!');
        },
      ),
      emptiedNavigationWidget: EmptiedNavigationWidget(
        msg: 'No member!',
        buttonMsg: 'Add member',
        onTapButtonFunc: () {
          print('click!');
        },
      ),
    );
  }
}
