import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var sum = 0.0.obs;
  var a = 0.0.obs;
  var b = 0.0.obs;
  var name = "".obs;
  updateSum(double newSum) {
    sum.value = newSum;
  }

  updateValues(a, b) {
    this.a.value = a;
    this.b.value = b;
  }

  updateName(String name) {
    this.name.value = name;
  }
}
