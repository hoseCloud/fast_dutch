import 'package:fast_dutch/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseGroupCard extends StatefulWidget {
  final GroupModel groupModel;

  const ChooseGroupCard({
    super.key,
    required this.groupModel,
  });

  @override
  State<ChooseGroupCard> createState() => _ChooseGroupCardState();
}

class _ChooseGroupCardState extends State<ChooseGroupCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () async {
          final prefs = await SharedPreferences.getInstance();
          setState(() {
            prefs.setString('chooseGroup', widget.groupModel.id);
          });
        },
        child: Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
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
          ),
        ),
      ),
    );
  }
}
