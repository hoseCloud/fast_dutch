import 'package:fast_dutch/models/receipt_model.dart';
import 'package:flutter/material.dart';

class Receipt extends StatelessWidget {
  final ReceiptModel receiptModel;

  const Receipt({
    super.key,
    required this.receiptModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              receiptModel.title ?? '',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              receiptModel.price == null ? '0' : receiptModel.price.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Text('members'),
          ],
        ),
      ),
    );
  }
}
