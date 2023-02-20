import 'dart:convert';

class GroupModel {
  late final String id;
  String? title;
  List<String>? memberIds;

  GroupModel({
    this.title,
    this.memberIds,
  }) {
    id = DateTime.now().toString();
  }
  GroupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json["title"];
    memberIds ??= [];
    for (var member in jsonDecode(json["memberIds"])) {
      memberIds!.add(member["id"]);
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title ?? '',
        'memberIds': memberIds == null ? [] : memberIds.toString(),
      };
}
