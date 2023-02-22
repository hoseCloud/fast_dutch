import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonMsg;
  final Function() onTapFunc;

  const Button({
    super.key,
    required this.buttonMsg,
    required this.onTapFunc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunc,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey,
        ),
        child: Text(
          buttonMsg,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
