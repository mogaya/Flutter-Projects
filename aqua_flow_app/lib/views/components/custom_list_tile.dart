import 'package:aqua_flow_app/configs/constants.dart';
import 'package:flutter/material.dart';

class customListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;

  const customListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: appYellow,
          size: 24,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: appBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
