import 'package:get/get.dart';

class OrderController extends GetxController {
  var orderList = [].obs;

  updateOrderList(list) {
    orderList.value = list;
  }
}
