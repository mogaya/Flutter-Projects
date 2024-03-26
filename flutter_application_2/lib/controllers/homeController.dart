import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  var selectedPage = 0.obs;
  updateSelectedPage(index) => selectedPage.value = index;
}
