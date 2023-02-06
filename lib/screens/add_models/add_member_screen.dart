import 'dart:convert';

import 'package:fast_dutch/models/member_model.dart';
import 'package:fast_dutch/widgets/input_screen_widget.dart';
import 'package:fast_dutch/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  MemberModel memberData = MemberModel();
  late List<Widget> inputs = [
    Input(
      title: '이름',
      onSaved: (str) {
        setState(() {
          memberData.name = str;
        });
      },
      validator: (str) {
        return null;
      },
    ),
  ];

  void onTapAddMember() async {
    const keyMember = "member";
    final prefs = await SharedPreferences.getInstance();
    List<String> members = prefs.getStringList(keyMember) ?? [];

    members.add(jsonEncode(memberData.toJson()));
    prefs.setStringList(keyMember, members);
  }

  @override
  Widget build(BuildContext context) {
    return InputScreen(
      appBarMsg: 'Add Member',
      inputs: inputs,
      onTapFunc: onTapAddMember,
    );
  }
}
