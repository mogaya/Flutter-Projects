import 'package:flutter/material.dart';
import 'package:flutter_application_2/configs/constants.dart';
import 'package:flutter_application_2/controllers/calculatorController.dart';
import 'package:flutter_application_2/views/custombutton.dart';
import 'package:flutter_application_2/views/customfield.dart';
import 'package:flutter_application_2/views/customtext.dart';
import 'package:get/get.dart';

class Calculator extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  CalculatorController calculatorController = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 90, 20, 40),
      child: Column(
        children: [
          CustomTextField(
            controller: nameController,
            hintMessage: 'Enter Name',
          ),
          SizedBox(
            height: 30,
          ),
          CustomTextField(
            controller: num1Controller,
            hintMessage: "Enter Num 1",
          ),
          SizedBox(
            height: 30,
          ),
          CustomTextField(
            controller: num2Controller,
            hintMessage: "Enter Num 2",
          ),
          SizedBox(
            height: 30,
          ),
          // customButton(label: "Sum")
          ElevatedButton(
              onPressed: () {
                double a = double.parse(num1Controller.text);
                double b = double.parse(num2Controller.text);
                String name = nameController.text;

                double s = a + b;
                calculatorController.updateSum(s);
                calculatorController.updateValues(a, b);
                calculatorController.updateName(name);

                num1Controller.text = "";
                num2Controller.text = "";
                nameController.text = "";

                // print("Sum is $sum");
              },
              child: Text("Calculate")),
          SizedBox(
            height: 30,
          ),
          Obx(
            () => CustomText(
              label:
                  "Hi ${calculatorController.name} says the sum of ${calculatorController.a} and ${calculatorController.a} is: ${calculatorController.sum}",
              labelColor: primaryColor,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          MaterialButton(
            onPressed: () => Get.toNamed("/"),
            child: Text(
              "Back to Login",
              style: TextStyle(
                color: appWhiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            height: 50,
            minWidth: 200,
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],
      ),
    );
  }
}
