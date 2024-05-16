import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_digitale_tablette/views/pages/home/home_screen.dart';
import 'package:menu_digitale_tablette/views/pages/welcome/welcome_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  List<String> languages = [];
  int selectedLanguageIndex = -1;

  Future<void> _fetchLanguages() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      languages = ["Francais", "Anglais", "Arabe", "Espangnol", "Italien"];
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchLanguages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: 100.w,
          height: 100.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage("assets/images/login.png"),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(85, 84, 84, 0.494).withOpacity(0.7)),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.569444444444444.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text("Table",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "poppins",
                              fontSize: 0.09.dp,
                              fontWeight: FontWeight.w500,
                            )),
                        Text("10",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "poppins",
                              fontSize: 0.13.dp,
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ),
                  ],
                ),
                Container(
                  width:80.13888888888889.w ,
                  height: 89.47916666666667.h,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Column(
                      children: [
                        GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => WelcomeScreen()),
                        );
                      },
                      child: Container(
                        child: Image.asset(
                          "assets/images/foodeatupservice.png",
                          height: 0.333.dp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.24.dp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: languages.asMap().entries.map((entry) {
                        final int index = entry.key;
                        final String language = entry.value;
                        return Container(
                          width: 0.33.dp,
                          height: 7.291666666666667.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0.06.dp),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedLanguageIndex = index;
                                });
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                );
                              },
                              child: Text(
                                language,
                                style: TextStyle(fontSize: 0.105.dp),
                              ),
                              style: OutlinedButton.styleFrom(
                                textStyle: TextStyle(color: Colors.white),
                                backgroundColor: selectedLanguageIndex == index
                                    ? Colors.red
                                    : Color.fromRGBO(139, 139, 139, 0.49)
                                        .withOpacity(0.2),
                                foregroundColor: Colors.white,
                                side: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                    style: selectedLanguageIndex == index
                                        ? BorderStyle.solid
                                        : BorderStyle.solid),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                minimumSize: Size(0.35.dp, 0.2.dp),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0.13.dp),
                      child: Container(
                        width: 21.944444444444443.w,
                        height: 3.3333333333333335.h,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "SÉLECTIONNER VOTRE LANGUE",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 0.17.dp),
                    Container(
                      width: 17.98611111111111.w,
                      height: 5.h,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Privacy Policy | Terms of service\n© 2024 All rights Reserved.",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
