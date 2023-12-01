import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_colors.dart';

import '../../../controllers/theme_controller.dart';
import '../../widgets/parametre/parametre_dialog.dart';

class ParametreThemePopUp extends StatefulWidget {
  const ParametreThemePopUp({super.key});

  @override
  State<ParametreThemePopUp> createState() => _ParametreThemePopUpState();
}

class _ParametreThemePopUpState extends State<ParametreThemePopUp> {
  String _selectedOption = 'Petit';

  final List<String> _options = ['Petit', 'Moyenne', 'Large'];
  @override
  Widget build(BuildContext context) {
    return ParametreDialog(
      titleText: "Théme",
      iconPath: "assets/icons/pen-icon.png",
      subtitleText: "Personaliser votre menu",
      buttonText: "Enregistrer",
      bodyContent: Consumer<ThemeController>(
        builder: (context, themeController, _) => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios)),
                  const Spacer(),
                  Text(
                    "Théme",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Personnaliser votre menu",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Adapter le thème de votre menu selon vos besoins spécifiques",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: greyColor),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Image.asset("assets/icons/style-text-icon.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Style de texte",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: greyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: DropdownButton<String>(
                          underline: const SizedBox(),
                          value: _selectedOption,
                          onChanged: (String? newValue) {
                            _selectedOption = newValue!;
                            // setState(() {});
                          },
                          iconEnabledColor: greyColor,
                          items: _options
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: greyColor),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Image.asset("assets/icons/style-text-icon.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(" Couleur du text",
                      style: Theme.of(context).textTheme.subtitle1),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              titlePadding: const EdgeInsets.all(0),
                              contentPadding: const EdgeInsets.all(0),
                              content: SingleChildScrollView(
                                child: MaterialPicker(
                                  pickerColor: themeController.textColor,
                                  onColorChanged:
                                      themeController.changetextColor,
                                  enableLabel: false,
                                  portraitOnly: false,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        color:
                            Provider.of<ThemeController>(context).newTextColor,
                        height: 40,
                        width: 80,
                      ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Image.asset("assets/icons/text-color-icon.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("Couleur d'arriere plan",
                      style: Theme.of(context).textTheme.subtitle1),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              titlePadding: const EdgeInsets.all(0),
                              contentPadding: const EdgeInsets.all(0),
                              content: SingleChildScrollView(
                                child: MaterialPicker(
                                  pickerColor: Colors.black,
                                  onColorChanged:
                                      themeController.changebackgroundColor,

                                  // enableLabel: false,
                                  // portraitOnly: false,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Provider.of<ThemeController>(context)
                                .newBackgroundColor,
                            border: Border.all(color: Colors.red)),
                        height: 40,
                        width: 80,
                      ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Image.asset("assets/icons/button-color-icon.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("Couleur primaire",
                      style: Theme.of(context).textTheme.subtitle1),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              titlePadding: const EdgeInsets.all(0),
                              contentPadding: const EdgeInsets.all(0),
                              content: SingleChildScrollView(
                                child: BlockPicker(
                                  pickerColor: themeController.primaryColor,
                                  onColorChanged:
                                      themeController.changeprimaryColor,
                                  // enableLabel: false,
                                  // portraitOnly: false,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        color: Provider.of<ThemeController>(context)
                            .newPrimaryColor,
                        height: 40,
                        width: 80,
                      ))
                ],
              ),
              SizedBox(
                height:
                    Device.orientation == Orientation.landscape ? 10.h : 35.h,
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
