import 'package:fast_dutch/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  void onTapAddGroup() {
    print('hi');
  }

  @override
  Widget build(BuildContext context) {
    return Navigation(
      emptyMsg: 'No any group!',
      emptyButtonMsg: 'Add group',
      addButtonMsg: 'Add reciept',
      widgets: const [],
      onTapAddFunc: onTapAddGroup,
      onTapEmptyFunc: onTapAddGroup,
    );
  }
}
