import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:menu_digitale_tablette/helpers/providers/Auth.dart';
import 'package:menu_digitale_tablette/helpers/providers/Establishments.dart';
import 'package:menu_digitale_tablette/helpers/providers/Screens.dart';
import 'package:menu_digitale_tablette/views/pages/establishment/establishment_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Auth _provider = Provider.of<Auth>(context);
    final Establishments _estabProvider =
        Provider.of<Establishments>(context, listen: false);
ScreenController screenProvider = Provider.of<ScreenController>(context);


    return Scaffold(
      body: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.9),
            image: DecorationImage(
              image: AssetImage("assets/images/login.png"),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(44, 44, 44, 0.694).withOpacity(0.8)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(2.0139.w, 5.3125.h, 0, 0),
                        child: Image.asset(
                          "/home/rabi3/Desktop/foodeatupservice.png",
                          width: 8.6111.w,
                          height: 6.1458.h,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 43.75.w,
                        height: 56.041666666666664.h,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: 650,
                            height: 695,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 92,
                                  top: 40,
                                  child: Container(
                                    width: 355,
                                    height: 438,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/foodimg1.jpeg"),
                                        fit: BoxFit.cover,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 275.46,
                                  top: 119.52,
                                  child: Transform(
                                    transform: Matrix4.identity()
                                      ..translate(0.0, 0.0)
                                      ..rotateZ(0.09),
                                    child: Container(
                                      width: 354.99,
                                      height: 450.16,
                                      decoration: ShapeDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/breakfast.jpeg"),
                                          fit: BoxFit.cover,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    left: 11,
                                    top: 264.96,
                                    child: Transform(
                                        transform: Matrix4.identity()
                                          ..translate(0.0, 0.0)
                                          ..rotateZ(-0.0),
                                        child: Container(
                                            width: 366.99,
                                            height: 438.16,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: Transform(
                                                    transform:
                                                        Matrix4.identity()
                                                          ..translate(0.0, 0.0)
                                                          ..rotateZ(-0.17),
                                                    child: Container(
                                                      width: 354.99,
                                                      height: 438.16,
                                                      decoration:
                                                          ShapeDecoration(
                                                        color:
                                                            Color(0xFFF8717D),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 40.57,
                                                  top: 127.86,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 30.0),
                                                    child: SizedBox(
                                                      width: 326.22,
                                                      height: 61.87,
                                                      child: Transform(
                                                        transform:
                                                            Matrix4.identity()
                                                              ..translate(
                                                                  0.0, 0.0)
                                                              ..rotateZ(-0.20),
                                                        child: Text(
                                                          'Des plats savoureux',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 32,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 0.04,
                                                            letterSpacing: -1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 55.78,
                                                  top: 59.17,
                                                  child: SizedBox(
                                                    width: 263.71,
                                                    height: 60.86,
                                                    child: Transform(
                                                      transform:
                                                          Matrix4.identity()
                                                            ..translate(
                                                                0.0, 0.0)
                                                            ..rotateZ(-0.20),
                                                      child: FittedBox(
                                                        child: Text(
                                                          'Dégustez ',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 56,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 0.02,
                                                            letterSpacing: -1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 81.14,
                                                  top: 151.86,
                                                  child: Transform(
                                                    transform:
                                                        Matrix4.identity()
                                                          ..translate(0.0, 0.0)
                                                          ..rotateZ(-0.17),
                                                    child: Container(
                                                      width: 248.49,
                                                      height: 248.49,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              "assets/images/plat.png"),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))))
                              ],
                            ),
                          ),
                        ),
                      ),
                      BlurryContainer(
                        child: Container(
                          width: 36.5972.w,
                          height: 68.8542.h,
                          padding: EdgeInsets.fromLTRB(3.5416666666666665.w,
                              8.541666666666666.h, 3.5416666666666665.w, 1.h),
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                                center: Alignment(-1, -0.4),
                                radius: 2.9,
                                colors: [
                                  Colors.grey.withOpacity(0.7),
                                  Colors.transparent,
                                ],
                                stops: [
                                  0.22,
                                  0.6
                                ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 12.01388888888889.w,
                                              height: 5.h,
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Connexion",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "poppins",
                                                    fontSize: 32,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 1.25.h),
                                        Row(
                                          children: [
                                            Container(
                                              width: 25.694444444444443.w,
                                              height: 3.3333333333333335.h,
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Bienvenue dans votre menu digital ",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Poppins",
                                                    fontSize: 21,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.1042.h),
                                Container(
                                  height: 6.5625.h,
                                  child: Stack(
                                    children: [
                                      TextFormField(
                                        textAlignVertical:
                                            TextAlignVertical.top,
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your email';
                                          }
                                          return null;
                                        },
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 1.3888888888888888.w),
                                            child: Container(
                                              width: 3.125.w,
                                              height: 2.5.h,
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Text(
                                                  "Email",
                                                  style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 24, 16, 16),
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.1042.h),
                                Container(
                                  height: 6.5625.h,
                                  width: 29.444444444444446.w,
                                  child: Stack(
                                    children: [
                                      TextFormField(
                                        textAlignVertical:
                                            TextAlignVertical.top,
                                        controller: _passwordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: UnderlineInputBorder(),
                                        ),
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 24, 16, 16),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your password';
                                          }
                                          return null;
                                        },
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 1.3888888888888888.w),
                                            child: Container(
                                              width: 7.5.w,
                                              height: 2.5.h,
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Text(
                                                  "Mot De Passe",
                                                  style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 24, 16, 16),
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.4167.h),
                                Container(
                                  height: 6.5625.h,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        final SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        final result = await _provider.login(
                                          _emailController.text,
                                          _passwordController.text,
                                        );
                                        result.fold(
                                          (error) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'Failed to login! $error'),
                                              ),
                                            );
                                          },
                                          (data) async {
                                            _provider.updateToken(
                                                data['token'].toString());
                                            await prefs.setString(
                                                'Token', _provider.token);
                                            _estabProvider.getEstablishments();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EstablishmentsScreen(),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: 7.083333333333333.w,
                                      height: 2.3958333333333335.h,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text(
                                          'Connecter',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(238, 48, 65, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3.125.h,
                                ),
                                Container(
                                  width: 29.166666666666668.w,
                                  height: 3.75.h,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Text(
                                      "En vous connectant, vous acceptez notre politique de confidentialité\net nos conditions d’utilisation.",
                                      style: TextStyle(
                                        height: 1.8,
                                        color: Colors.white,
                                        fontFamily: "poppins",
                                        fontSize: 12,
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7.291666666666667.h,
                  ),
                  Container(
                    width: 18.125.w,
                    height: 5.h,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Privacy Policy | Terms of service\n© 2024 All rights Reserved.",
                        style: TextStyle(
                          height: 1.8,
                          color: Colors.white,
                          fontFamily: "poppins",
                          fontSize: 48,
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
        ),
      ),
    );
  }
}
