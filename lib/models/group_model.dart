import 'member_model.dart';

class GroupModel {
  final DateTime id = DateTime.now();
  final String? title;
  final List<MemberModel>? members;

  GroupModel({
    this.title,
    this.members,
  });
}
