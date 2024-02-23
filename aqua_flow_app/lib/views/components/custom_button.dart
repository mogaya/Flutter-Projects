import 'package:aqua_flow_app/configs/constants.dart';
import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;

  const customButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: appWhite,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(25),
        child: child,
      ),
    );
  }
}
