import 'dart:convert';

import 'package:fast_dutch/models/member_model.dart';
import 'package:fast_dutch/screens/add_models/add_member_screen.dart';
import 'package:fast_dutch/widgets/member_widget.dart';
import 'package:fast_dutch/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({super.key});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  late final SharedPreferences prefs;
  late List<String>? members;
  final List<Widget> memberWidgets = [];

  @override
  void initState() {
    super.initState();
    initMembers();
  }

  void onTapAddMember() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddMemberScreen(),
      ),
    );
    refreshMembers();
  }

  void initMembers() async {
    prefs = await SharedPreferences.getInstance();
    refreshMembers();
  }

  void refreshMembers() {
    members = prefs.getStringList('member');

    setState(() {
      for (var member in members ?? []) {
        var memberModel = MemberModel.fromJson(jsonDecode(member));
        memberWidgets.add(Member(
          memberModel: memberModel,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Navigation(
      emptyMsg: 'No any member!',
      emptyButtonMsg: 'Add member',
      addButtonMsg: 'Add member',
      widgets: memberWidgets,
      onTapAddFunc: onTapAddMember,
      onTapEmptyFunc: onTapAddMember,
    );
  }
}
