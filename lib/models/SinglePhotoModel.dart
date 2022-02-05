import 'dart:ffi';

class SinglePhotoModel {
  String url;
  String caption;
  String description;
  String ownerName;
  String ownerId;
  int currentPrice;
  int bidCount;
  int likeCount;

  SinglePhotoModel(this.url, this.caption, this.description, this.ownerName, this.ownerId, this.currentPrice, this.bidCount, this.likeCount);

  SinglePhotoModel.fromJson(Map<String, dynamic> json)
      : url = json["url"],
        caption = json["caption"],
        description = json["description"],
        ownerName = json["owner_name"],
        ownerId = json["owner_id"],
        likeCount = json["like_count"],
        bidCount = json["bid_count"],
        currentPrice = json["current_price"];

  Map<String, dynamic> toJson(){
    return <String, dynamic> {
      'url': url,
      'caption': caption,
      'description': description,
      'owner_name': ownerName,
      'owner_id': ownerId,
    };
  }

// ProductModel.withError(String s) {}
}