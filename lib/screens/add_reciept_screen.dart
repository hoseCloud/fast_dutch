import 'package:fast_dutch/models/receipt_model.dart';
import 'package:flutter/material.dart';

import '../models/group_model.dart';

class AddRecieptScreen extends StatefulWidget {
  final String? group;
  const AddRecieptScreen({
    super.key,
    this.group,
  });

  @override
  State<AddRecieptScreen> createState() => _AddRecieptScreenState();
}

class _AddRecieptScreenState extends State<AddRecieptScreen> {
  String? _group, _title, _price, _payers, _dutches;
  late ReceiptModel receipt;

  @override
  void initState() {
    _group = widget.group;
    super.initState();
  }

  void _scanGroup(String value) {
    setState(() {
      _group = value;
    });
  }

  void _scanTitle(String value) {
    setState(() {
      _title = value;
    });
  }

  void _scanPrice(String value) {
    setState(() {
      _price = value;
    });
  }

  void _scanPayers(String value) {
    setState(() {
      _payers = value;
    });
  }

  void _scanDutches(String value) {
    setState(() {
      _dutches = value;
    });
  }

  void onTapAddReceipt() {
    receipt = ReceiptModel(
      group: GroupModel(),
      title: _title ?? 'blank',
      price: int.parse(_price ?? '0'),
    );

    print(receipt.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add reciept'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(4),
            color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                widget.group == null
                    ? input('모임', _scanGroup)
                    : inputBlock(widget.group!),
                input('제목', _scanTitle),
                input('기격', _scanPrice),
                input('지출 인원', _scanPayers),
                input('참여 인원', _scanDutches),
                GestureDetector(
                  onTap: onTapAddReceipt,
                  child: Container(
                    child: const Text(
                      '영수증 추가하기',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField input(String title, Function(String) func) {
    return TextField(
      obscureText: false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: title,
      ),
      onChanged: func,
    );
  }

  TextField inputBlock(String title) {
    return TextField(
      obscureText: false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: title,
      ),
      enabled: false,
    );
  }
}
