import 'package:fast_dutch/new_widget/button_widget.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  final String msg;
  final List<Widget> inputs;
  final Function() onTapFunc;

  const InputScreen({
    super.key,
    required this.msg,
    required this.inputs,
    required this.onTapFunc,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(msg),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Flexible(
                flex: 4,
                child: ListView(
                  children: inputs,
                ),
              ),
              Flexible(
                flex: 1,
                child: Button(
                  buttonMsg: msg,
                  onTapFunc: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      onTapFunc();
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
