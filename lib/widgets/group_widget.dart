import 'package:flutter/material.dart';

class Group extends StatelessWidget {
  const Group({
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'title',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Text('2023-01-25 18:54'),
                ],
              ),
              const Text('members'),
            ],
          ),
        ),
      ),
    );
  }
}
