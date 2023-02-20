import 'dart:convert';

import 'package:fast_dutch/models/receipt_model.dart';
import 'package:fast_dutch/screens/input_screen.dart';
import 'package:fast_dutch/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditReceiptScreen extends StatefulWidget {
  const EditReceiptScreen({
    super.key,
    this.receiptModel,
  });
  final ReceiptModel? receiptModel;

  @override
  State<EditReceiptScreen> createState() => _EditReceiptScreenState();
}

class _EditReceiptScreenState extends State<EditReceiptScreen> {
  ReceiptModel receiptData = ReceiptModel();
  late List<Widget> inputs = [
    Input(
      title: '모임',
      initialValue: widget.receiptModel?.groupId,
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
      initialValue: widget.receiptModel?.title,
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
      initialValue: widget.receiptModel?.price.toString(),
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
      initialValue: '',
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
      initialValue: '',
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

  void onTapEditReceipt() async {
    const keyReceipt = "receipt";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> receipts = prefs.getStringList(keyReceipt) ?? [];

    for (var receipt in receipts) {
      var json = jsonDecode(receipt);
      if (json['id'] == widget.receiptModel!.id) {
        int index = receipts.indexOf(receipt);
        receipts.removeAt(index);
        receipts.insert(index, jsonEncode(receiptData.toJson()));
        prefs.setStringList(keyReceipt, receipts);
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InputScreen(
      appBarMsg: 'Edit Receipt',
      inputs: inputs,
      onTapFunc: onTapEditReceipt,
    );
  }
}
