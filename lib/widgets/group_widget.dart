import 'package:fast_dutch/models/group_model.dart';
import 'package:flutter/material.dart';

class Group extends StatelessWidget {
  final GroupModel groupModel;
  const Group({
    super.key,
    required this.groupModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              groupModel.title ?? '',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text('members'),
          ],
        ),
      ),
    );
  }
}
