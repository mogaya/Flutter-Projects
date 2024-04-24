import 'package:get/get.dart';

class LoginController extends GetxController {
  var phoneNumber = ''.obs;

  updatePhoneNumber(num) {
    phoneNumber.value = num;
  }
}
