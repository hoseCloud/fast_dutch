import 'dart:convert';

import 'package:fast_dutch/models/receipt_model.dart';
import 'package:fast_dutch/screens/add_models/add_reciept_screen.dart';
import 'package:fast_dutch/widgets/navigation_widget.dart';
import 'package:fast_dutch/widgets/receipt_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecieptScreen extends StatefulWidget {
  const RecieptScreen({super.key});

  @override
  State<RecieptScreen> createState() => _RecieptScreenState();
}

class _RecieptScreenState extends State<RecieptScreen> {
  late final SharedPreferences prefs;
  late List<String>? receipts;
  final List<Widget> receiptWidgets = [];

  @override
  void initState() {
    super.initState();
    initReceipts();
  }

  void onTapAddReciept() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddRecieptScreen(),
      ),
    );
    refreshReceipts();
  }

  void initReceipts() async {
    prefs = await SharedPreferences.getInstance();
    refreshReceipts();
  }

  void refreshReceipts() {
    receipts = prefs.getStringList('receipt');

    setState(() {
      for (var receipt in receipts ?? []) {
        var receiptModel = ReceiptModel.fromJson(jsonDecode(receipt));
        receiptWidgets.add(Receipt(receiptModel: receiptModel));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Navigation(
      emptyMsg: 'No any reciept!',
      emptyButtonMsg: 'Add reciept',
      addButtonMsg: 'Add reciept',
      widgets: receiptWidgets,
      onTapAddFunc: onTapAddReciept,
      onTapEmptyFunc: onTapAddReciept,
    );
  }
}
