class ReceiptModel {
  late final String id;
  String? groupId;
  String? title;
  int? price;
  List<String>? payerIds;
  List<String>? dutchIds;

  ReceiptModel({
    this.groupId,
    this.title,
    this.price,
    this.payerIds,
    this.dutchIds,
  }) {
    id = DateTime.now().toString();
  }
  ReceiptModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group'];
    title = json['title'];
    price = int.parse(json['price']);
    payerIds ??= [];
    for (var payerId in json['payerIds']) {
      payerIds!.add(payerId['id']);
    }
    dutchIds ??= [];
    for (var dutchId in json["dutchIds"]) {
      dutchIds!.add(dutchId['id']);
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'groupId': groupId ?? '',
        'title': title ?? '',
        'price': price == null ? '0' : price.toString(),
        'payerIds': payerIds == null ? [] : payerIds.toString(),
        'dutchIds': dutchIds == null ? [] : dutchIds.toString(),
      };
}
