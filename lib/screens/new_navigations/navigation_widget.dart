import 'package:flutter/material.dart';

class NavigationWidget extends StatelessWidget {
  final List<Widget> widgets;

  const NavigationWidget({
    super.key,
    required this.widgets,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: widgets.isNotEmpty
          ? FilledNavigationWidget(
              widgets: widgets,
            )
          : const EmptiedNavigationWidget(),
    );
  }
}

class FilledNavigationWidget extends StatelessWidget {
  final List<Widget> widgets;

  const FilledNavigationWidget({
    super.key,
    required this.widgets,
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
        const Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Text('This is Button'),
          ),
        ),
      ],
    );
  }
}

class EmptiedNavigationWidget extends StatelessWidget {
  const EmptiedNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('empty');
  }
}
