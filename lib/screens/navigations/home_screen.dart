import 'dart:convert';

import 'package:fast_dutch/models/receipt_model.dart';
import 'package:fast_dutch/screens/add_models/add_receipt_screen.dart';
import 'package:fast_dutch/screens/choose_group_screen.dart';
import 'package:fast_dutch/widgets/navigation_widget.dart';
import 'package:fast_dutch/widgets/receipt_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final SharedPreferences prefs;
  String chooseGroup = '';
  late List<String>? receipts;
  final List<Widget> receiptWidgets = [];

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
    chooseGroup = prefs.getString('chooseGroup') ?? '';

    print(chooseGroup);

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

  void onTapChooseGroup() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ChooseGroupScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return chooseGroup != '' ? yesGroup() : noGroup();
  }

  Navigation noGroup() {
    return Navigation(
      emptyMsg: 'No choose group!',
      emptyButtonMsg: 'Choose group',
      addButtonMsg: 'Add receipt',
      widgets: const [],
      onTapAddFunc: onTapAddReceipt,
      onTapEmptyFunc: onTapChooseGroup,
    );
  }

  Widget yesGroup() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: receiptWidgets.isNotEmpty
          ? Column(
              children: [
                Flexible(
                  flex: 4,
                  child: ListView(
                    children: receiptWidgets,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(
                          buttonMsg: 'Add receipt',
                          onTapFunc: onTapAddReceipt,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Button(
                          buttonMsg: 'Choose group',
                          onTapFunc: onTapChooseGroup,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'No any receipt!',
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  Row(
                    children: [
                      Button(
                        buttonMsg: 'Add receipt',
                        onTapFunc: onTapAddReceipt,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Button(
                        buttonMsg: 'Choose group',
                        onTapFunc: onTapChooseGroup,
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
