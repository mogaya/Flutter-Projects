import 'package:aqua_flow_app/configs/constants.dart';
import 'package:flutter/material.dart';

class customText extends StatelessWidget {
  final String label;
  final Color labelColor;
  final double fontSize;
  final FontWeight fontWeight;
  // final TextAlign? textAlign;

  const customText({
    super.key,
    required this.label,
    this.fontSize = 12,
    this.labelColor = appBlack,
    this.fontWeight = FontWeight.normal,
    // this.textAlign,
    // this.alignment = Alignment.topLeft,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        label,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: labelColor,
        ),
      ),
    );
  }
}
