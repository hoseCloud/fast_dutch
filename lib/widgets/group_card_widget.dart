import 'dart:convert';

import 'package:fast_dutch/models/group_model.dart';
import 'package:fast_dutch/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupCard extends StatefulWidget {
  final GroupModel groupModel;
  final Function() refreshGroupFunc;

  const GroupCard({
    super.key,
    required this.groupModel,
    required this.refreshGroupFunc,
  });

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
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
          child: isOpen ? groupCardOpen(context) : groupCardClose(context),
        ),
      ),
    );
  }

  void onTapEdit() {
    print('edit!');
  }

  void onTapDelete() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> groups = prefs.getStringList('group') ?? [];
    late String target;

    for (var group in groups) {
      var json = jsonDecode(group);
      if (json['id'] == widget.groupModel.id) {
        target = group;
        setState(() {
          groups.remove(target);
          prefs.setStringList('group', groups);
          widget.refreshGroupFunc();
        });
        break;
      }
    }
  }

  Column groupCardOpen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.groupModel.id,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          widget.groupModel.title ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'member',
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

  Column groupCardClose(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.groupModel.title ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Text('member'),
      ],
    );
  }
}
