class GroupModel {
  final String id = DateTime.now().toString();
  String? title;
  Set<String>? memberIds;

  GroupModel({
    this.title,
    this.memberIds,
  });
  GroupModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    memberIds ??= {};
    for (var member in json["memberIds"]) {
      memberIds!.add(member["id"]);
    }
  }
}
