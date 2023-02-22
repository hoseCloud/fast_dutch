import 'package:fast_dutch/widgets/input_widget.dart';
import 'package:fast_dutch/screens/navigations/input_screen.dart';
import 'package:flutter/material.dart';

class AddReceiptScreen extends StatefulWidget {
  const AddReceiptScreen({super.key});

  @override
  State<AddReceiptScreen> createState() => _AddReceiptScreenState();
}

class _AddReceiptScreenState extends State<AddReceiptScreen> {
  String title = '';
  String price = '';

  @override
  Widget build(BuildContext context) {
    List<Widget> inputs = [
      const Text('This is group input'),
      Input(
        title: '영수증 제목',
        onSaved: (str) {
          setState(() {
            title = str ?? '';
          });
        },
        validator: (str) {
          return null;
        },
      ),
      Input(
        title: '가격',
        onSaved: (str) {
          setState(() {
            price = str ?? '';
          });
        },
        validator: (str) {
          return null;
        },
      ),
      const Text('This is payer input'),
      const Text('This is dutch input'),
    ];

    return InputScreen(
      msg: 'Add receipt',
      inputs: inputs,
      onTapFunc: () {
        print('click!');
      },
    );
  }
}
