import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:menu_digitale_tablette/views/pages/home/home_screen.dart';

class Tablewelcome extends StatelessWidget {
  const Tablewelcome({super.key});

  @override
  Widget build(BuildContext context) {
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
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                      color:
                          Color.fromRGBO(44, 44, 44, 0.694).withOpacity(0.8)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(2.0139.w, 5.3125.h, 0, 0),
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
                        width: 36.52777777777778.w,
                        height: 68.22916666666666.h,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 27.98611111111111.w,
                                height: 41.979166666666664.h,
                                child: Image.asset(
                                    "assets/images/welcometable.png"),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 2.8125.h),
                                child: Container(
                                    child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    "Sélectionner une table pour commencer",
                                    style: TextStyle(
                                        fontSize: 32,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                              ),
                              Container(
                                width: 17.291666666666668.w,
                                height: 6.145833333333333.h,
                                
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen(),
                                          ),
                                        );
                                    },
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(238, 48, 65, 1)),shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)))),
                                    child: Container(
                                        width: 11.73611111111111.w,
                                        height: 2.5.h,
                                        child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.table_bar_outlined,
                                                  size: 22,
                                                  color: Colors.white,
                                                ),
                                                Text("Sélectionner une table",style: TextStyle(color: Colors.white,fontSize: 16),),
                                              ],
                                            )))),
                              )
                            ]),
                      )
                    ],
                  )),
            )));
  }
}
