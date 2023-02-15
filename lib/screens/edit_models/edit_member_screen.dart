import 'dart:convert';

import 'package:fast_dutch/models/member_model.dart';
import 'package:fast_dutch/screens/input_screen.dart';
import 'package:fast_dutch/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditMemberScreen extends StatefulWidget {
  const EditMemberScreen({
    super.key,
    this.memberModel,
  });
  final MemberModel? memberModel;

  @override
  State<EditMemberScreen> createState() => _EditMemberScreenState();
}

class _EditMemberScreenState extends State<EditMemberScreen> {
  MemberModel memberData = MemberModel();
  late List<Widget> inputs = [
    Input(
      title: '이름',
      initialValue: widget.memberModel?.name,
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

  void onTapEditMember() async {
    const keyMember = "member";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> members = prefs.getStringList(keyMember) ?? [];

    for (var member in members) {
      var json = jsonDecode(member);
      if (json['id'] == widget.memberModel!.id) {
        int index = members.indexOf(member);
        members.removeAt(index);
        members.insert(index, jsonEncode(memberData.toJson()));
        prefs.setStringList(keyMember, members);
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InputScreen(
      appBarMsg: 'Edit Member',
      inputs: inputs,
      onTapFunc: onTapEditMember,
    );
  }
}
