import 'dart:convert';

import 'package:fast_dutch/models/receipt_model.dart';
import 'package:fast_dutch/screens/edit_models/edit_receipt_screen.dart';
import 'package:fast_dutch/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReceiptCard extends StatefulWidget {
  final ReceiptModel receiptModel;
  final Function() refreshReceiptFunc;

  const ReceiptCard({
    super.key,
    required this.receiptModel,
    required this.refreshReceiptFunc,
  });

  @override
  State<ReceiptCard> createState() => _ReceiptCardState();
}

class _ReceiptCardState extends State<ReceiptCard> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          child: isOpen ? receiptCardOpen(context) : receiptCardClose(context),
        ),
      ),
    );
  }

  void onTapEdit() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditReceiptScreen(
          receiptModel: widget.receiptModel,
        ),
      ),
    );
    widget.refreshReceiptFunc();
  }

  void onTapDelete() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> receipts = prefs.getStringList('receipt') ?? [];
    late String target;

    for (var receipt in receipts) {
      var json = jsonDecode(receipt);
      if (json['id'] == widget.receiptModel.id) {
        target = receipt;
        setState(() {
          receipts.remove(target);
          prefs.setStringList('receipt', receipts);
          widget.refreshReceiptFunc();
        });
        break;
      }
    }
  }

  Column receiptCardOpen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.receiptModel.id,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          widget.receiptModel.groupId ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          widget.receiptModel.title ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          widget.receiptModel.price == null
              ? '0'
              : widget.receiptModel.price.toString(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'payer',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'dutch',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Button(
              buttonMsg: 'edit',
              onTapFunc: onTapEdit,
            ),
            const SizedBox(
              width: 10,
            ),
            Button(
              buttonMsg: 'delete',
              onTapFunc: onTapDelete,
            ),
          ],
        ),
      ],
    );
  }

  Column receiptCardClose(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.receiptModel.title ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          widget.receiptModel.price == null
              ? '0'
              : widget.receiptModel.price.toString(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Text('member'),
      ],
    );
  }
}
