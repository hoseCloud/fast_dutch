import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  final String emptyMsg, emptyButtonMsg, addButtonMsg;
  final List<Widget> widgets;
  final Function() onTapAddFunc, onTapEmptyFunc;

  const Navigation({
    super.key,
    required this.emptyMsg,
    required this.emptyButtonMsg,
    required this.addButtonMsg,
    required this.widgets,
    required this.onTapAddFunc,
    required this.onTapEmptyFunc,
  });

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: widget.widgets.isNotEmpty
          ? Column(
              children: [
                Flexible(
                  flex: 4,
                  child: ListView(
                    children: widget.widgets,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Button(
                      buttonMsg: widget.addButtonMsg,
                      onTapFunc: widget.onTapAddFunc,
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.emptyMsg,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  Button(
                    buttonMsg: widget.emptyButtonMsg,
                    onTapFunc: widget.onTapEmptyFunc,
                  ),
                ],
              ),
            ),
    );
  }
}

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
