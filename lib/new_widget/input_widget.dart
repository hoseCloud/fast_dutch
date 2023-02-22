import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({
    super.key,
    required this.title,
    required this.onSaved,
    required this.validator,
    this.initialValue,
  });

  final String title;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? initialValue;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      obscureText: false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.title,
      ),
      onSaved: widget.onSaved,
      validator: widget.validator,
    );
  }
}
