import 'package:fast_dutch/models/group_model.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatefulWidget {
  final GroupModel groupModel;
  const GroupCard({
    super.key,
    required this.groupModel,
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
