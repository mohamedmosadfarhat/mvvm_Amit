class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});
  ProductModel.fromJason(json) {
    id = json["id"];
    title = json["title"];
    price = json["price"] is int?(json["price" ] as int).toDouble():json["price"];
    description = json["description"];
    category = json["category"];
    image = json["image"];
    //rating = Rating.fromJson(json);
  }
}

class Rating {
  double? rate;
  int? count;
  Rating.fromJson(json) {
    rate = json["rate"];
    count = json["count"];
  }
}
