import 'dart:convert';

import 'package:fast_dutch/models/group_model.dart';
import 'package:fast_dutch/widgets/choose_group_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseGroupScreen extends StatefulWidget {
  const ChooseGroupScreen({super.key});

  @override
  State<ChooseGroupScreen> createState() => _ChooseGroupScreenState();
}

class _ChooseGroupScreenState extends State<ChooseGroupScreen> {
  late final SharedPreferences prefs;
  late List<String> groups;
  late List<Widget> groupWidgets = [];

  @override
  void initState() {
    super.initState();
    initGroups();
  }

  void initGroups() async {
    prefs = await SharedPreferences.getInstance();
    refreshGroups();
  }

  void refreshGroups() {
    groupWidgets = [];

    setState(() {
      groups = prefs.getStringList('group') ?? [];
      for (var group in groups) {
        var groupModel = GroupModel.fromJson(jsonDecode(group));
        groupWidgets.add(ChooseGroupCard(groupModel: groupModel));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose group'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: groupWidgets,
        ),
      ),
    );
  }
}
