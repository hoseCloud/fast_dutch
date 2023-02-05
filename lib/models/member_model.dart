class MemberModel {
  late final String id;
  String? name;

  MemberModel({
    this.name,
  }) {
    id = DateTime.now().toString();
  }
  MemberModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name ?? '',
      };
}
