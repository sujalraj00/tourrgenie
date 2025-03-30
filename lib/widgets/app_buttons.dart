import 'package:flutter/material.dart';
import 'package:tourgenie/misc/colors.dart';
import 'package:tourgenie/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  String? text;
  bool? isIcon;
  IconData? iconData;
  final Color boderColor;
  AppButtons(
      {super.key,
      this.isIcon = false,
      this.text = "hi",
      this.iconData,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.boderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: boderColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Icon(
              iconData,
              color: color,
            ),
    );
    ;
  }
}
