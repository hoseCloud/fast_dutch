import 'package:fast_dutch/models/group_model.dart';
import 'package:flutter/material.dart';

class Group extends StatefulWidget {
  final GroupModel groupModel;
  const Group({
    super.key,
    required this.groupModel,
  });

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
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
          child: isOpen ? groupOpen(context) : groupClose(context),
        ),
      ),
    );
  }

  Column groupOpen(BuildContext context) {
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

  Column groupClose(BuildContext context) {
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
