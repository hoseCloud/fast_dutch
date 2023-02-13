import 'dart:convert';

import 'package:fast_dutch/models/member_model.dart';
import 'package:fast_dutch/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Member extends StatefulWidget {
  final MemberModel memberModel;

  const Member({
    super.key,
    required this.memberModel,
  });

  @override
  State<Member> createState() => _MemberState();
}

class _MemberState extends State<Member> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          child: isOpen ? memberOpen(context) : memberClose(context),
        ),
      ),
    );
  }

  void onTapEdit() {
    print('edit!');
  }

  void onTapDelete() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> members = prefs.getStringList('member') ?? [];
    late String target;

    for (var member in members) {
      var json = jsonDecode(member);
      if (json['id'] == widget.memberModel.id) {
        target = member;
        break;
      }
    }

    setState(() {
      members.remove(target);
      prefs.setStringList('member', members);
    });
  }

  Widget memberOpen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.memberModel.id,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          widget.memberModel.name ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Button(
              buttonMsg: 'edit',
              onTapFunc: onTapEdit,
            ),
            const SizedBox(
              width: 10,
            ),
            Button(
              buttonMsg: 'delete',
              onTapFunc: onTapDelete,
            ),
          ],
        ),
      ],
    );
  }

  Widget memberClose(BuildContext context) {
    return Text(
      widget.memberModel.name ?? '',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
