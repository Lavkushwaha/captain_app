// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  Item({
    this.id,
    this.imgUrl,
    this.name,
    this.netWt,
    this.grossWt,
  });

  int? id;
  String? imgUrl;
  String? name;
  String? netWt;
  String? grossWt;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        imgUrl: json["img_url"],
        name: json["name"] ?? "",
        netWt: json["net_wt"],
        grossWt: json["gross_wt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "img_url": imgUrl,
        "name": name,
        "net_wt": netWt,
        "gross_wt": grossWt,
      };
}
