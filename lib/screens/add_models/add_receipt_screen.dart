
import 'dart:convert';

import 'package:fast_dutch/models/receipt_model.dart';
import 'package:fast_dutch/widgets/input_screen_widget.dart';
import 'package:fast_dutch/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddReceiptScreen extends StatefulWidget {
  final String? group;
  const AddReceiptScreen({
    super.key,
    this.group,
  });

  @override
  State<AddReceiptScreen> createState() => _AddReceiptScreenState();
}

class _AddReceiptScreenState extends State<AddReceiptScreen> {
  ReceiptModel receiptData = ReceiptModel();
  late List<Widget> inputs = [
    Input(
      title: '모임',
      onSaved: (str) {
        setState(() {
          receiptData.groupId = str;
        });
      },
      validator: (str) {
        return null;
      },
    ),
    Input(
      title: '제목',
      onSaved: (str) {
        setState(() {
          receiptData.title = str;
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
          try {
            receiptData.price = int.parse(str ?? '0');
          } on FormatException {
            receiptData.price = 0;
          }
        });
      },
      validator: (str) {
        return null;
      },
    ),
    Input(
      title: '결제한 사람',
      onSaved: (str) {
        setState(() {
          receiptData.payerIds = [];
        });
      },
      validator: (str) {
        return null;
      },
    ),
    Input(
      title: '더치한 사람',
      onSaved: (str) {
        setState(() {
          receiptData.dutchIds = [];
        });
      },
      validator: (str) {
        return null;
      },
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  void onTapAddReceipt() async {
    const keyReceipt = "receipt";
    final prefs = await SharedPreferences.getInstance();
    List<String> receipts = prefs.getStringList(keyReceipt) ?? [];

    receipts.add(jsonEncode(receiptData.toJson()));
    prefs.setStringList(keyReceipt, receipts);
  }

  @override
  Widget build(BuildContext context) {
    return InputScreen(
      appBarMsg: 'Add Receipt',
      inputs: inputs,
      onTapFunc: onTapAddReceipt,
    );
  }
}
