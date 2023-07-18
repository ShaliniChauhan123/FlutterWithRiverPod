import 'package:flutter/material.dart';

class TempWidget extends StatelessWidget {
  final String title;
  final Color iconColor;
  final Color titleColor;

  const TempWidget({
    required this.iconColor,
    required this.title,
    required this.titleColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('#', style: TextStyle(color: iconColor)),
        Text(
          title,
          style: TextStyle(
              color: titleColor, fontSize: 12.0, fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
