import 'package:flutter/material.dart';

class Member extends StatelessWidget {
  const Member({
    super.key,
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
            'name',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
