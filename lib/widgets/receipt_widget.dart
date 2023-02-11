import 'package:fast_dutch/models/receipt_model.dart';
import 'package:flutter/material.dart';

class Receipt extends StatefulWidget {
  final ReceiptModel receiptModel;

  const Receipt({
    super.key,
    required this.receiptModel,
  });

  @override
  State<Receipt> createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
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
          child: isOpen ? receiptOpen(context) : receiptClose(context),
        ),
      ),
    );
  }

  Column receiptOpen(BuildContext context) {
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
      ],
    );
  }

  Column receiptClose(BuildContext context) {
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
