import 'dart:convert';

import 'package:fast_dutch/models/group_model.dart';
import 'package:fast_dutch/screens/input_screen.dart';
import 'package:fast_dutch/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditGroupScreen extends StatefulWidget {
  const EditGroupScreen({
    super.key,
    this.groupModel,
  });
  final GroupModel? groupModel;

  @override
  State<EditGroupScreen> createState() => _EditGroupScreenState();
}

class _EditGroupScreenState extends State<EditGroupScreen> {
  GroupModel groupData = GroupModel();
  late List<Widget> inputs = [
    Input(
      title: '제목',
      initialValue: widget.groupModel?.title,
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
      initialValue: '',
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

  void onTapEditGroup() async {
    const keyGroup = "group";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> groups = prefs.getStringList(keyGroup) ?? [];

    for (var group in groups) {
      var json = jsonDecode(group);
      if (json['id'] == widget.groupModel!.id) {
        int index = groups.indexOf(group);
        groups.removeAt(index);
        groups.insert(index, jsonEncode(groupData.toJson()));
        prefs.setStringList(keyGroup, groups);
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InputScreen(
      appBarMsg: 'Edit Group',
      inputs: inputs,
      onTapFunc: onTapEditGroup,
    );
  }
}
