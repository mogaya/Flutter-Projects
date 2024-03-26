import 'package:get/get.dart';

class StudentController extends GetxController {
  final studentList = [].obs;
  final loadingStudentData = true.obs;
  updateStudentList(list) {
    studentList.value = list;
  }

  updateLoadingStudentData(loading) {
    loadingStudentData.value = loading;
  }
}
