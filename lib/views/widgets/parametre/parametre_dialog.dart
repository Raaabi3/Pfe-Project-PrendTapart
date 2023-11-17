import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_colors.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';
import 'package:menu_digitale_tablette/views/widgets/parametre/parametre_button.dart';

class ParametreDialog extends StatelessWidget {
  final String titleText;
  final String iconPath;
  final String subtitleText;
  final String buttonText;
  final VoidCallback? onTap;
  final Widget? bodyContent;
  const ParametreDialog({
    super.key,
    required this.titleText,
    required this.iconPath,
    required this.subtitleText,
    required this.buttonText,
    this.bodyContent,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // UnComment these image.Asset

                Image.asset(iconPath),
                const SizedBox(width: 5),
                Text(titleText, style: headline, textAlign: TextAlign.center),
                const SizedBox(width: 5),
                // UnComment these image.Asset

                Image.asset(iconPath),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              subtitleText,
              style: body.copyWith(color: greyColor),
            ),
            const SizedBox(height: 10),
            bodyContent ?? const SizedBox(),
            const SizedBox(height: 10),
            ParametreButton(
              onTap: onTap,
              buttonText: buttonText,
            )
          ],
        ),
      ),
    );
  }
}
