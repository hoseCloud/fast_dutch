class ReceiptModel {
  final String id = DateTime.now().toString();
  String? groupId;
  String? title;
  int? price;
  Set<String>? payerIds;
  Set<String>? dutchIds;

  ReceiptModel({
    this.groupId,
    this.title,
    this.price,
    this.payerIds,
    this.dutchIds,
  });
  ReceiptModel.fromJson(Map<String, dynamic> json) {
    groupId = json["group"];
    title = json["title"];
    price = int.parse(json["price"]);
    payerIds ??= {};
    for (var payerId in json["payerIds"]) {
      payerIds!.add(payerId["id"]);
    }
    dutchIds ??= {};
    for (var dutchId in json["dutchIds"]) {
      dutchIds!.add(dutchId["id"]);
    }
  }
}
