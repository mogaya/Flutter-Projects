import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/studentcontroller.dart';
import 'package:flutter_application_2/models/studentmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// var names = ["Mogaya", "Mwita"];
// ignore: non_constant_identifier_names
StudentController studentController = Get.put(StudentController());

class Students extends StatelessWidget {
  const Students({super.key});

  @override
  Widget build(BuildContext context) {
    getStudentList();
    return Obx(
      () => Column(
        children: [
          studentController.loadingStudentData.value
              ? Center(child: Text("Loading"))
              : ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => Row(
                        children: [
                          Text("${index + 1}  "),
                          // Image.network(
                          //     '${studentController.studentList[index].image}'),
                          Text(
                              '${studentController.studentList[index].sname}  '),
                          Text(
                              '${studentController.studentList[index].admissionum}'),
                        ],
                      ),
                    );
                  },
                  itemCount: studentController.studentList.length,
                )
        ],
      ),
    );
  }

  Future<void>? getStudentList() async {
    try {
      http.Response response;
      response = await http
          .get(Uri.parse("https://churchapp.co.ke/students/read.php"));

      if (response.statusCode == 200) {
        var studentResponse = json.decode(response.body);
        var studentDataResponse = studentResponse['data'];

        var newList = studentDataResponse
            .map((std) => StudentModel.fromJson(std))
            .toList();
        studentController.updateStudentList(newList);

        print(response.body);
      } else {
        // print("Server error occured ${response.statusCode}");
      }
      studentController.updateLoadingStudentData(false);
    } catch (exception) {
      print(exception.toString());
    }
  }
}
