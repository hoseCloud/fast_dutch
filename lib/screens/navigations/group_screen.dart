import 'dart:convert';

import 'package:fast_dutch/models/group_model.dart';
import 'package:fast_dutch/screens/add_models/add_group_screen.dart';
import 'package:fast_dutch/widgets/group_widget.dart';
import 'package:fast_dutch/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  late final SharedPreferences prefs;
  late List<String>? groups;
  final List<Widget> groupWidgets = [];

  @override
  void initState() {
    super.initState();
    initGroups();
  }

  void onTapAddGroup() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddGroupScreen(),
      ),
    );
    refreshGroups();
  }

  void initGroups() async {
    prefs = await SharedPreferences.getInstance();
    refreshGroups();
  }

  void refreshGroups() {
    groups = prefs.getStringList('group');

    setState(() {
      for (var group in groups ?? []) {
        var groupModel = GroupModel.fromJson(jsonDecode(group));
        groupWidgets.add(Group(groupModel: groupModel));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Navigation(
      emptyMsg: 'No any group!',
      emptyButtonMsg: 'Add group',
      addButtonMsg: 'Add group',
      widgets: groupWidgets,
      onTapAddFunc: onTapAddGroup,
      onTapEmptyFunc: onTapAddGroup,
    );
  }
}
