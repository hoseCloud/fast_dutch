import 'package:fast_dutch/new_widget/input_widget.dart';
import 'package:fast_dutch/screens/new_navigations/input_screen.dart';
import 'package:flutter/material.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    List<Widget> inputs = [
      Input(
        title: '이름',
        onSaved: (str) {
          setState(() {
            name = str ?? '';
          });
        },
        validator: (str) {
          return null;
        },
      ),
    ];

    return InputScreen(
      msg: 'Add member',
      inputs: inputs,
      onTapFunc: () {
        print('click!');
      },
    );
  }
}
