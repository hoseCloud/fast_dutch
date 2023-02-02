class MemberModel {
  final String id = DateTime.now().toString();
  late String name;

  MemberModel({
    required this.name,
  });
  MemberModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
  }
}
