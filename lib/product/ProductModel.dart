import 'dart:ffi';

class ProductModel {
  String url;
  String caption;
  String description;
  String ownerName;
  String ownerId;
  int currentPrice;

  ProductModel(this.url, this.caption, this.description, this.ownerName, this.ownerId, this.currentPrice);

  ProductModel.fromJson(Map<String, dynamic> json)
      : url = json["url"],
        caption = json["caption"],
        description = json["description"],
        ownerName = json["owner_name"],
        ownerId = json["owner_id"],
        currentPrice = json["current_price"];

  // ProductModel.withError(String s) {}
}
