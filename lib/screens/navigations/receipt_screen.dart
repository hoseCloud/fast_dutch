import 'dart:convert';

import 'package:fast_dutch/models/receipt_model.dart';
import 'package:fast_dutch/screens/add_models/add_receipt_screen.dart';
import 'package:fast_dutch/widgets/navigation_widget.dart';
import 'package:fast_dutch/widgets/receipt_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReceiptScreen extends StatefulWidget {
  const ReceiptScreen({super.key});

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  late final SharedPreferences prefs;
  late List<String>? receipts;
  List<Widget> receiptWidgets = [];

  @override
  void initState() {
    super.initState();
    initReceipts();
  }

  void onTapAddReceipt() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddReceiptScreen(),
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
    receiptWidgets = [];

    setState(() {
      for (var receipt in receipts ?? []) {
        var receiptModel = ReceiptModel.fromJson(jsonDecode(receipt));
        receiptWidgets.add(ReceiptCard(
          receiptModel: receiptModel,
          refreshReceiptFunc: refreshReceipts,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Navigation(
      emptyMsg: 'No any receipt!',
      emptyButtonMsg: 'Add receipt',
      addButtonMsg: 'Add receipt',
      widgets: receiptWidgets,
      onTapAddFunc: onTapAddReceipt,
      onTapEmptyFunc: onTapAddReceipt,
    );
  }
}
