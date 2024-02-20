import 'package:flutter/material.dart';
import 'package:flutter_application_2/configs/constants.dart';

class CustomText extends StatelessWidget {
  final String label;
  final Color labelColor;
  final double fontSize;
  final FontWeight fontWeight;
  // final TextEditingController

  const CustomText({
    super.key,
    required this.label,
    this.labelColor = appGrey,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        label,
        style: TextStyle(
            color: labelColor, fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}


// class CustomText extends StatelessWidget {
//   final String label;
//   final Color labelColor;
//   final double fontSize;
//   final FontWeight fontWeight;

//   const CustomText(
//       {super.key,
//       required this.label,
//       this.labelColor = appGrey,
//       this.fontSize = 18,
//       this.fontWeight = FontWeight.normal,
//       });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Text(
//         label,
//         style:
//             const TextStyle(color: appGrey, fontSize, fontWeight: FontWeight),
//       ),
//     );
//   }
// }
