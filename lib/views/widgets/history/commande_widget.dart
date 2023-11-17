import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_colors.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';

class CommandeWidget extends StatelessWidget {
  final String commandeName;
  final int productsNumber;
  final VoidCallback onTap;
  const CommandeWidget(
      {super.key,
      required this.commandeName,
      required this.productsNumber,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
          onTap: onTap,
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: greyColor.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(children: [
                    CircleAvatar(
                        radius: 25,
                        backgroundColor: pinkColor,
                        child: Center(
                          child: Text("#01",
                              style: subhead.copyWith(color: Colors.white)),
                        )),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(commandeName,
                            style: subhead.copyWith(color: Colors.black)),
                        Text("Nombre des produits : $productsNumber produits",
                            style: body.copyWith(color: greyColor))
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Confirmé ",
                            style: body.copyWith(color: Colors.green)),
                        Text("11/07/2023 - 11:44:34 ",
                            style: body.copyWith(color: greyColor))
                      ],
                    )
                  ])))),
    );
  }
}
