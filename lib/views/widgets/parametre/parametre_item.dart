import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_colors.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';

class ParametreItem extends StatelessWidget {
  final String text;
  final String iconPath;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final TextStyle? style;
  const ParametreItem({
    super.key,
    required this.text,
    required this.iconPath,
    this.onTap,
    this.padding,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: pinkColor,
              child: Image.asset(
                iconPath,
                color: Colors.white,
                height: 20,
              ),
            ),
            const SizedBox(width: 5),
            Text(text, style: style ?? body),
            const Spacer(),
            const Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}
