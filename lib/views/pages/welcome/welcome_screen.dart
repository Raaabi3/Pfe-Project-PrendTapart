import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_digitale_tablette/views/pages/welcome/language_screen.dart';
import 'package:menu_digitale_tablette/views/pages/login/loginform.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.9),
          image: DecorationImage(
            image: AssetImage("assets/images/home.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: 5.1042.h, horizontal: 3.1944.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/foodeatupservice.png",
                    width: 8.6111.w,
                    height: 6.1458.h,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  Container(
                    height: 5.h,
                    width: 10.1389.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginForm()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Color.fromRGBO(82, 82, 82, 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0.01.w.h),
                        child: AutoSizeText(
                          minFontSize: 0,
                          maxFontSize: 16,
                          textAlign: TextAlign.left,
                          'Login',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 2.4,
                              letterSpacing: 0.5,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 24.2708.h, 0.5417.w, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Padding(
                        padding:  EdgeInsets.all(1.0),
                        child: AutoSizeText(
                          'SUPER FACILE & RAPIDE',
                          style: GoogleFonts.workSans(
                              fontSize: 10.h,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "MENU DIGITALE",
                        style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w900,
                          fontSize: 10.h,
                          background: Paint()..color = Colors.transparent,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1
                            ..color = Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.5833.h,),
                    Row(
                      children: [
                        SizedBox(
                          width: 68.6806.w,
                        ),
                        Container(
                          width: 14.7222.w,
                          height: 9.2708.h,
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  "Pour Votre restaurant!",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 1.6667.h,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,
                                    letterSpacing: 0.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.7708.h,
                              ),
                              Container(
                                height: 4.8.h,
                                width: 14.7222.w,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Language()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(238, 48, 65, 1),
                                    padding:
                                        EdgeInsets.symmetric(vertical:1.25.h, horizontal: 4.6875.w),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                    ),
                                    side: BorderSide.none,
                                    elevation: 0,
                                  ),
                                  child: AutoSizeText(
                                    "Démarrer",
                                    minFontSize: 0,
                                    maxFontSize: 16,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      height: 2.4,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.4733.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
