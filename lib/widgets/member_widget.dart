import 'package:fast_dutch/models/member_model.dart';
import 'package:flutter/material.dart';

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
