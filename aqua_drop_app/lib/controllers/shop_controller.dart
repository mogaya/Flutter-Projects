import 'package:get/get.dart';

class ShopController extends GetxController {
  var selectedPage = 0.obs;
  setSelectedPage(index) {
    selectedPage.value = index;
  }
}
