import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_colors.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';

class ParametreButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  final Color? color;
  final Color? textColor;
  const ParametreButton(
      {super.key,
      required this.buttonText,
      this.onTap,
      this.color,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color ?? darkPurpleColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            buttonText,
            style: body.copyWith(
                color: textColor ?? Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
