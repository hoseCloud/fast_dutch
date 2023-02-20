import 'dart:convert';

import 'package:fast_dutch/models/member_model.dart';
import 'package:fast_dutch/screens/edit_models/edit_member_screen.dart';
import 'package:fast_dutch/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemberCard extends StatefulWidget {
  final MemberModel memberModel;
  final Function() refreshMemberFunc;

  const MemberCard({
    super.key,
    required this.memberModel,
    required this.refreshMemberFunc,
  });

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
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
          child: isOpen ? memberCardOpen(context) : memberCardClose(context),
        ),
      ),
    );
  }

  void onTapEdit() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditMemberScreen(
          memberModel: widget.memberModel,
        ),
      ),
    );
    widget.refreshMemberFunc();
  }

  void onTapDelete() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> members = prefs.getStringList('member') ?? [];
    late String target;

    for (var member in members) {
      var json = jsonDecode(member);
      if (json['id'] == widget.memberModel.id) {
        target = member;
        setState(() {
          members.remove(target);
          prefs.setStringList('member', members);
          widget.refreshMemberFunc();
        });
        break;
      }
    }
  }

  Widget memberCardOpen(BuildContext context) {
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

  Widget memberCardClose(BuildContext context) {
    return Text(
      widget.memberModel.name ?? '',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
