
import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  InputScreen({
    super.key,
    required this.appBarMsg,
    required this.inputs,
    required this.onTapFunc,
  });

  final formKey = GlobalKey<FormState>();
  final List<Widget> inputs;
  final String appBarMsg;
  final Function() onTapFunc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarMsg),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(4),
            color: Colors.amber,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (Widget input in inputs) input,
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        onTapFunc();
                      }
                    },
                    child: Container(
                      child: Text(
                        appBarMsg,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
