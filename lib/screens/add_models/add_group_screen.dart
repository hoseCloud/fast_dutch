import 'dart:convert';

import 'package:fast_dutch/models/group_model.dart';
import 'package:fast_dutch/widgets/input_screen_widget.dart';
import 'package:fast_dutch/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddGroupScreen extends StatefulWidget {
  const AddGroupScreen({
    super.key,
  });

  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  GroupModel groupData = GroupModel();
  late List<Widget> inputs = [
    Input(
      title: '제목',
      onSaved: (str) {
        setState(() {
          groupData.title = str;
        });
      },
      validator: (str) {
        return null;
      },
    ),
    Input(
      title: '모임 참여자',
      onSaved: (str) {
        setState(() {
          groupData.memberIds = [];
        });
      },
      validator: (str) {
        return null;
      },
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  void onTapAddReceipt() async {
    const keyGroup = "group";
    final prefs = await SharedPreferences.getInstance();
    List<String> receipts = prefs.getStringList(keyGroup) ?? [];

    receipts.add(jsonEncode(groupData.toJson()));
    prefs.setStringList(keyGroup, receipts);
  }

  @override
  Widget build(BuildContext context) {
    return InputScreen(
      appBarMsg: 'Add Group',
      inputs: inputs,
      onTapFunc: onTapAddReceipt,
    );
  }
}
