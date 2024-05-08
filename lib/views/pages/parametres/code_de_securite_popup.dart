import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/views/pages/plan_de_table/plan_de_table_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:side_sheet/side_sheet.dart';

import '../../widgets/parametre/parametre_dialog.dart';

class CodeDeSecuritePopUp extends StatefulWidget {
  const CodeDeSecuritePopUp({super.key});

  @override
  State<CodeDeSecuritePopUp> createState() => _CodeDeSecuritePopUpState();
}

class _CodeDeSecuritePopUpState extends State<CodeDeSecuritePopUp> {
  final _pinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xffF5F5F5)),
      borderRadius: BorderRadius.circular(12),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return ParametreDialog(
      titleText: "Code de sécurité",
      iconPath: "assets/icons/code-sec-icon.png",
      subtitleText:
          "Entrer un code PIN du restaurant qui est composer de six chiffre",
      buttonText: "Suivant",
      bodyContent: Column(
        children: [
          Form(
            key: _formKey,
            child: Pinput(
              controller: _pinController,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyDecorationWith(
                // border: Border.all(color: const Color(0xFF72B2EE)),
                borderRadius: BorderRadius.circular(12),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: Colors.black),
                ),
              ),
              validator: (value) => value == null
                  ? 'le code PIN est obligatoir'
                  : value.length != 4
                      ? 'le code PIN est incorrect'
                      : null,
              length: 4,
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).pop();
        SideSheet.right(
          body: const PlanDeTableScreen(),
          context: context,
          width: MediaQuery.of(context).size.width * 0.8,
        );
        
      },
    );
  }
}
