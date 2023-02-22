import 'package:fast_dutch/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class NavigationWidget extends StatelessWidget {
  final bool isEmpty;
  final Widget filledNavigationWidget, emptiedNavigationWidget;

  const NavigationWidget({
    super.key,
    required this.isEmpty,
    required this.filledNavigationWidget,
    required this.emptiedNavigationWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: isEmpty ? emptiedNavigationWidget : filledNavigationWidget,
    );
  }
}

class FilledNavigationWidget extends StatelessWidget {
  final List<Widget> widgets;
  final String buttonMsg;
  final Function() onTapButtonFunc;

  const FilledNavigationWidget({
    super.key,
    required this.widgets,
    required this.buttonMsg,
    required this.onTapButtonFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 4,
          child: ListView(
            children: widgets,
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Button(
              buttonMsg: buttonMsg,
              onTapFunc: onTapButtonFunc,
            ),
          ),
        ),
      ],
    );
  }
}

class EmptiedNavigationWidget extends StatelessWidget {
  final String msg, buttonMsg;
  final Function() onTapButtonFunc;

  const EmptiedNavigationWidget({
    super.key,
    required this.msg,
    required this.buttonMsg,
    required this.onTapButtonFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            msg,
            style: const TextStyle(
              fontSize: 32,
            ),
          ),
          Button(
            buttonMsg: buttonMsg,
            onTapFunc: onTapButtonFunc,
          ),
        ],
      ),
    );
  }
}
