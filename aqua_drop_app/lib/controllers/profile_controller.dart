import 'package:get/get.dart';

class ProfileController extends GetxController {
  var profileList = [].obs;

  updateProfileList(list) {
    profileList.value = list;
  }
}
