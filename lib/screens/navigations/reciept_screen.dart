import 'package:fast_dutch/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';

class RecieptScreen extends StatefulWidget {
  const RecieptScreen({super.key});

  @override
  State<RecieptScreen> createState() => _RecieptScreenState();
}

class _RecieptScreenState extends State<RecieptScreen> {
  void onTapAddReciept() {
    print('hi');
  }

  @override
  Widget build(BuildContext context) {
    return Navigation(
      emptyMsg: 'No any reciept!',
      emptyButtonMsg: 'Add reciept',
      addButtonMsg: 'Add reciept',
      widgets: const [],
      onTapAddFunc: onTapAddReciept,
      onTapEmptyFunc: onTapAddReciept,
    );
  }
}
