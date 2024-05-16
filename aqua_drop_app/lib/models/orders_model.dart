class OrderModel {
  var username;
  var amount;
  var productName;
  var userImage;
  var orderID;

  OrderModel({
    this.orderID,
    this.username,
    this.amount,
    this.productName,
    this.userImage,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderID: json['orderID'],
      username: json['username'],
      amount: json['amount'],
      productName: json['p_name'],
      userImage: json['userImage'],
    );
  }
}
