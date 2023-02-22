import 'package:fast_dutch/new_widget/input_widget.dart';
import 'package:fast_dutch/screens/new_navigations/input_screen.dart';
import 'package:flutter/material.dart';

class AddGroupScreen extends StatefulWidget {
  const AddGroupScreen({super.key});

  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  String title = '';

  @override
  Widget build(BuildContext context) {
    List<Widget> inputs = [
      Input(
        title: '모임 이름',
        onSaved: (str) {
          setState(() {
            title = str ?? '';
          });
        },
        validator: (str) {
          return null;
        },
      ),
      const Text('This is members input'),
    ];

    return InputScreen(
      msg: 'Add group',
      inputs: inputs,
      onTapFunc: () {
        print('click!');
      },
    );
  }
}
