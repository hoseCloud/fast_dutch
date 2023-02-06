import 'dart:convert';

class GroupModel {
  final String id = DateTime.now().toString();
  String? title;
  List<String>? memberIds;

  GroupModel({
    this.title,
    this.memberIds,
  });
  GroupModel.fromJson(Map<String, dynamic> json) {
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
