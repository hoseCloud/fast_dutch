import 'package:flutter/material.dart';

class InputBlock extends StatelessWidget {
  const InputBlock({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: title,
      ),
      enabled: false,
    );
  }
}
