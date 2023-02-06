import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.title,
    required this.onSaved,
    required this.validator,
  });

  final String title;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: title,
      ),
      onSaved: onSaved,
      validator: validator,
    );
  }
}
