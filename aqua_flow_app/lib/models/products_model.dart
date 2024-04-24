class ProductModel {
  var id;
  var p_name;
  var p_description;
  var p_image;
  var price;

  ProductModel(
      {required this.id,
      required this.p_name,
      required this.p_description,
      required this.p_image,
      required this.price});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        p_name: json['p_name'],
        p_description: json['p_description'],
        p_image: json['p_image'],
        price: json['price']);
  }
}
