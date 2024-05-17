import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:intl/intl.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String dayOfWeek = DateFormat('EEEE').format(now);
    String monthOfYear = DateFormat('MMMM').format(now);

    return Scaffold(
      body: Container(
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
              width: 100.w,
              height: 100.h,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            2.9166666666666665.w, 4.791666666666667.h, 0, 0),
                        child: Image.asset(
                          "/home/rabi3/Desktop/foodeatupservice.png",
                          width: 13.402777777777777.w,
                          height: 9.583333333333334.h,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  
                  Container(
                    child: Stack(
                      children: [
                      Container(
                        height: 28.666666666666664.h,
                        width: 28.541666666666664.w,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                              DateTime.timestamp().hour.toString() +
                                  ":" +
                                  DateTime.timestamp().minute.toString(),
                              style: TextStyle(
                                  fontSize: 160,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Poppins")),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 23.h),
                        child: Container(
                          width: 28.541666666666664.w,
                          height: 3.75.h,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              dayOfWeek.toString() +
                                  "," +
                                  DateTime.timestamp().day.toString() +
                                  " " +
                                  monthOfYear +
                                  " " +
                                  DateTime.timestamp().year.toString(),
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(height:28.h),
                  Container(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Row(children: [
                        Image.asset(
                          "assets/images/plat.png",
                          width: 5.555555555555555.w,
                          height: 8.333333333333332.h,
                        ),
                        Container(
                          height: 8.604166666666666.h,
                          width: 18.333333333333332.w,
                          child: Column(children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 10.458333333333332.w,
                                height: 4.375.h,
                                child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text("Jack Conev",style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600),)),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 2.8125.h,
                                child: FittedBox(
                                    child:
                                        Text("Connecté en tant que, Jack C",style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),)),
                              ),
                            )
                          ]),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
