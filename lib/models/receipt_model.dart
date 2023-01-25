import 'package:fast_dutch/models/group_model.dart';
import 'package:fast_dutch/models/member_model.dart';

class ReceiptModel {
  final DateTime id = DateTime.now();
  final GroupModel? group;
  final String? title;
  final int? price;
  final List<MemberModel>? payers;
  final List<MemberModel>? dutches;

  ReceiptModel({
    this.group,
    this.title,
    this.price,
    this.payers,
    this.dutches,
  });
}
