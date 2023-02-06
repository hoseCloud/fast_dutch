import 'package:fast_dutch/models/member_model.dart';
import 'package:flutter/material.dart';

class Member extends StatelessWidget {
  final MemberModel memberModel;

  const Member({
    super.key,
    required this.memberModel,
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
        child: SingleChildScrollView(
          child: Text(
            memberModel.name ?? '',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
