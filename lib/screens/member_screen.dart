import 'package:fast_dutch/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({super.key});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  void onTapAddMember() {
    print('hi');
  }

  @override
  Widget build(BuildContext context) {
    return Navigation(
      emptyMsg: 'No any member!',
      emptyButtonMsg: 'Add member',
      addButtonMsg: 'Add member',
      widgets: const [],
      onTapAddFunc: onTapAddMember,
      onTapEmptyFunc: onTapAddMember,
    );
  }
}
